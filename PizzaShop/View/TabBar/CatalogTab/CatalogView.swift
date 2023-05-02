//
//  CatalogView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct CatalogView: View {
    let layout = [GridItem(), GridItem()]
    
    @EnvironmentObject var viewModel: CatalogViewModel
    @State var selectedCategory: Category = Category.pizza
    var filteredCategoryProducts: [Product] {
            viewModel.products.filter { $0.category == selectedCategory}
        }
    @State var isSelectedCell = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(alignment: .bottom) {
                    leadingNavigationBarCatalogView()
                    Spacer()
                    Image("Menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50)
                        //.padding(.bottom)
                    Spacer()
                    trailingNavigationBarCatalogView()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                // All Categories...
                customMenuView()
                
//                        ScrollView(.horizontal, showsIndicators: false){
//                          HStack(spacing: 5) {
//                                ForEach(Category.allCases, id: \.self) {category in
//                                    CategoryCell(category: category, isSelectedCell: $isSelectedCell)
//                                        .onTapGesture {
//                                            selectedCategory = category
//                                        }
//                                }
//                           }
//                        }
//                        .padding(.horizontal, 5)
//                        .padding(.top)
                        
                // Name of Selected Category...
//                        HStack {
//                            Text("\(selectedCategory.rawValue)")
//                                .font(.body)
//                                .fontWeight(.bold)
//                                .foregroundColor(.burgundy)
//                        }
//                            .frame(maxWidth: .infinity)
//                            .padding(.bottom, 10)
                
                // Products of Selected Category...
                                ScrollView(.vertical, showsIndicators: false) {
                                    if filteredCategoryProducts.isEmpty {
                                        Text("Category is Empty").padding().font(.title3)
                                    } else {
                                        LazyVGrid(columns: layout) {
                                            ForEach(filteredCategoryProducts, id: \.self) {product in
                                                NavigationLink {
                                                    ProductDetailView(product: product)
                                                } label: {
                                                    ProductCard(product: product)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
            }
           // .navigationTitle("Menu")
            //.navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(
//                leading:
//                    leadingNavigationBarCatalogView(),
//                trailing:
//                    trailingNavigationBarCatalogView()
//            )
            .accentColor(.burgundy)
            
            }
    }
    
    @ViewBuilder
    func leadingNavigationBarCatalogView()->some View{
        HStack {
            Button {
                
            } label: {
                Image(systemName: "info.circle")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.burgundy)
                    )
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
                    .background(RoundedRectangle(cornerRadius: 12) .foregroundColor(.burgundy)
                    )
            }
        }
    }
    
    // MARK: Custom Menu
    @ViewBuilder
    func customMenuView()->some View{
        ScrollView(.horizontal, showsIndicators: false){
          HStack(spacing: 8) {
        ForEach(Category.allCases, id: \.self) {category in
            Text(category.rawValue)
                .padding(.horizontal)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(selectedCategory == category ? .white : .burgundy)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                  //  withAnimation(.easeInOut){
                        selectedCategory = category
                 //   }
                }
                .background(
                 //   ZStack {
//                        RoundedRectangle(cornerRadius: 65)
//                            .foregroundColor(Color.white)
//                            .shadow(radius: 1, x: 2, y: -2)
//                            .shadow(radius: 1, x: -1, y: 1)
                        
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.burgundy)
                            .opacity(selectedCategory == category ? 1.0 : 0.0)
                  //  }
                 
                   
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
