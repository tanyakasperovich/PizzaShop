//
//  ProductDetailView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import SwiftUI

struct ProductDetailView: View {
    var viewModel: ProductDetailViewModel
    @State var isSet = false
    @State var size: Size = .small
    @State var count = 1
    var product: ProductDB
 

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            AsyncImage(url: URL(string: product.thumbnail ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                   // .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
            
            //"photoAndComponents()
            
            VStack(alignment: .leading) {
                
            titleAndButtonFavorite()
            price()
            picker()
            stepper()
                
            buttonAddCart()
                
            description()
                
            }
            .padding()
        }
        .navigationTitle(product.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(
//            trailing:
//
//        )
        .accentColor(.burgundy)
    }
    
//    @ViewBuilder
//    func photoAndComponents()->some View{
//        ComponentsView(product: product)
//        //       .ignoresSafeArea(edges: .top)
//        .frame(height: 300)
//
//        CircleImage(image: Image(viewModel.product.imageURL))
//            .offset(y: -190)
//            .padding(.bottom, -190)
//            .padding(.horizontal)
//
//
//    }
    
    @ViewBuilder
    func titleAndButtonFavorite()->some View{
        HStack() {
            Text(product.title ?? "")
                .font(.title)
            FavoriteButton(isSet: $isSet, produtc: product)
            
         
        }
}

    @ViewBuilder
    func picker()->some View{
        Picker(selection: $size, label: Text("Size")) {
            ForEach(Size.allCases, id: \.self) { size in
                Text(size.rawValue)
                    .tag(size)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.greenDarkTextColor, lineWidth: 2)
        )


    }
    
    @ViewBuilder
    func buttonAddCart()->some View{
            Button {
          
                
          //      var position = Position(product: product, count: self.count, productSize: size)
                
        // /////////////////////
             //   position.product.price = viewModel.getPrice(size: size)
                
              //  CartViewModel.shared.addPosition(position)
               //// presentationMode.wrappedValue.dismiss()
            } label: {
                    Image(systemName: "cart")
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangleShape(color: .burgundy, radius: 25)
                    )
                
            }

    }
    @ViewBuilder
    func stepper()->some View{
        HStack {
            Stepper("Колличество", value: $count, in: 1...10)
            Text("\(count)")
        }
 
    }
    
    @ViewBuilder
    func price()->some View{
        HStack(alignment: .center) {

            Spacer()
            Text("1 x")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("\(viewModel.getPrice(size: self.size)) $")
                .font(.title2)
            
            
            
//            if isAddedToCart {
//                stepper()
//            } else {
//                buttonAddCart()
//            }
        }
        //.padding(.horizontal)
  
    }

    @ViewBuilder
    func description()->some View{
        Text("About \(product.title ?? "")")
            .font(.title2)
        HStack {
            Text("Calories in 100g")
            Spacer()
            Text("1 343")
            //Text(product.calories)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
        Divider()
        Text(product.description ?? "")
    }
}

//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(viewModel: ProductDetailViewModel(product: ProductDB(id: 1, title: "", description: "", price: 12, discountPercentage: 2.2, rating: 3.4, stock: 3, brand: "", category: "", thumbnail: "", images: ["String", ""])))
//
//    }
//}


