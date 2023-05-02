//
//  ProductDetailView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var viewModel: CatalogViewModel
    var product: Product
    @State var isSet = false
    @State var isSelectPicker: Size = .small
//    var productIndex: Int {
//        viewModel.products.firstIndex(where: { $0.id == product.id })!
//    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ComponentsView(product: product)
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)
            
            CircleImage(image: Image(product.imageURL))
                .offset(y: -190)
                .padding(.bottom, -190)
                .padding(.horizontal)
            
            
            VStack(alignment: .leading) {
        
                HStack() {
                   Text("\(product.price) $")
                        .font(.title)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                            Image(systemName: "cart")
                            .padding(12)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                            )
                        
                    }
                }
                .padding(.horizontal)
           

              picker()
                    .padding(.bottom)
                
                HStack() {
                    Text(product.title)
                        .font(.title)
                    FavoriteButton(isSet: $isSet)
                }
                
                HStack {
                    Text("Calories in 100g")
                    Spacer()
                    Text("1 343")
                    //Text(product.calories)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(product.title)")
                    .font(.title2)
                Text(product.description)
            }
            .padding()
        }
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(
//            trailing:
//
//        )
        .accentColor(.burgundy)
    }
    
    @ViewBuilder
    func picker()->some View{
        Picker(selection: $isSelectPicker, label: Text("Size")) {
            Text(Size.small.rawValue)
                .tag(Size.small)
            Text(Size.medium.rawValue)
                .tag(Size.medium)
            Text(Size.large.rawValue)
                .tag(Size.large)
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.greenDarkTextColor, lineWidth: 2)
        )

    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product:  Product(title: "Chicken Pizza", imageURL: "chickenPizzaWithBellPeppersTomatoCheese", price: 25, description: "chicken Pizza With Bell Peppers, Tomato and Cheese", category: .pizza, isFavorite: false, components: [.cheese, .onione, .tomato])).environmentObject(CatalogViewModel())
    }
}
