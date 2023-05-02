//
//  ProductCardView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
   @State var isSet = false
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                Rectangle()
                    .foregroundColor(.cardBackground.opacity(0.2))
                
                VStack {
                    HStack() {
                        Spacer()
                        FavoriteButton(isSet: $isSet)
                    }
                    .padding(.top)
                    .padding(.trailing, 5)
                    .offset(y: 20)
                    .padding(.top, -20)
                    
                    CircleImage(image: Image(product.imageURL))
                        .padding()
                }
             }
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                Rectangle()
                    .foregroundColor(.white)
                HStack {
                    Text(product.title)
                    Spacer()
                    Text("\(product.price) $")
                }
                .padding(.horizontal, 5)
                .padding(.top, 5)
                .padding(.bottom)
                .foregroundColor(.burgundy)
            }
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

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product(title: "Вафли", imageURL: "Cake1", price: 12, description: "Вафли с карамелью", category: .dessert, isFavorite: false, components: []))
    }
}
