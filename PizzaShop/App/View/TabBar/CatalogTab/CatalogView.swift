//
//  CatalogView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject private var vm = ProductsViewModel()
    @EnvironmentObject var viewModel: CatalogViewModel
    @State var selectedCategory = ProductsViewModel.CategoryOption.pizza
//    var filteredCategoryProducts: [Product] {
//        viewModel.products.filter { $0.category == selectedCategory}
//    }
    @State var isSelectedCell = false
    @State private var showInfoView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView()
                
              //  ScrollView(.vertical, showsIndicators: false) {
                    Divider()
                HeaderCardView()
                    .onTapGesture {
                        showInfoView.toggle()
                    }
                
                 Divider()
                    
                customMenuView()
                // Products...
                GridsView()
          //  }
            }
            .accentColor(.burgundy)
            .sheet(isPresented: $showInfoView, content: {
            DiscountView()
           })
        }
    }

    
    // MARK: Custom Menu
    @ViewBuilder
    func customMenuView()->some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 8) {
                ForEach(ProductsViewModel.CategoryOption.allCases, id: \.self) {option in
                    Text(option.rawValue)
                        .padding(.horizontal)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(selectedCategory == option ? .white : .burgundy)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
//                            Task {
//                              try? await vm.categorySelected(option: option)
//
//                            }
                            selectedCategory = option
                        }
                        .background(
                            RoundedRectangleShape(color: .greenDarkTextColor, radius: 25)
                                .opacity(selectedCategory == option ? 1.0 : 0.0)
                        )
                }
            }.padding()
        }
    }
    
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
            .environmentObject(CatalogViewModel())
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            leadingNavigationBarCatalogView()
            Spacer()
            Image("Menu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            
            Spacer()
            trailingNavigationBarCatalogView()
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    @ViewBuilder
    func leadingNavigationBarCatalogView()->some View{
        HStack {
            NavigationLink {
                CatalogInfoView()
            } label: {
                Image(systemName: "info.circle")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(RoundedRectangleShape(color: .burgundy, radius: 12))
            }
        }
    }
    
    @ViewBuilder
    func trailingNavigationBarCatalogView()->some View{
        HStack {
            Button {
                
            } label: {
                Image(systemName: "phone")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(RoundedRectangleShape(color: .burgundy, radius: 12))
            }
        }
    }
}

struct GridsView: View {
    
    let layout = [GridItem(), GridItem()]
    @StateObject private var vm = ProductsViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if vm.products.isEmpty {
                Text("Category is Empty").padding().font(.title3)
            } else {
                LazyVGrid(columns: layout) {
                    ForEach(vm.products) { product in
                        NavigationLink {
                            ProductDetailView(viewModel: ProductDetailViewModel(product: product), product: product)
                        } label: {
                            VStack {
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                                    Circle()
                                        .foregroundColor(.cardBackground.opacity(0.2))
                                    VStack {
                                        AsyncImage(url: URL(string: product.thumbnail ?? "")) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 110, height: 110)
                                                .cornerRadius(55)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 75, height: 75)
                                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                        
                                    }
                                    .padding()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                Divider()
                                
                                HStack {
                                    Text(product.title ?? "")
                                        .bold()
                                    Spacer()
                                    Text("\(product.price ?? 0) $")
                                        .bold()
                                }
                                .padding(.horizontal, 10)
                                .padding(.top, 5)
                                .padding(.bottom)
                                .foregroundColor(.burgundy)
                                .frame(maxHeight: 30)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(Color.white)
                                    .shadow(radius: 2, x: 3, y: -3)
                                    .shadow(radius: 2, x: -1, y: 1)
                            )
                            .padding(5)
                            
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            vm.getProducts()
        }
    }
}



struct HeaderCardView: View {
    var body: some View {

            ZStack {
                // background...
                    RoundedRectangleShape(color: .greenDarkTextColor, radius: 25)

                // text...
                VStack {
                    Text("$7.99 Large 3-Topping Pizza")
                    .foregroundColor(Color.cardBackground)
                    .font(.headline)
                    .padding(.bottom)
                    
                    Text("Pick up a Large 3-Topping Pizza for only $7.99 at Pizza Shop! Order Now! ")
                        .font(.callout)
                        .foregroundColor(.cardBackground).opacity(0.8)
                }
                .padding()
              
            }
            .padding()
            .frame(height: getRect().width / 2.5)
        
        

    }
  
}


struct CatalogInfoView: View {
    var body: some View {
      Text("Info View")
    }
}

struct DiscountView: View {
    var body: some View {
        Text("Discount View")
    }
}
