//
//  ComponentsView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import SwiftUI

struct ComponentsView: View {
var product: Product
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.cardBackground.opacity(0.2))
            
            HStack(spacing: 15) {
                    ForEach(product.components, id: \.self) { image in
                        CircleImage(image: Image(image.image))
                          
                    }
                
                Button {
                    //
                } label: {
                    CircleImage(image: Image(systemName: "plus.app.fill"))
                    .foregroundColor(.white)
                }
                
               
                
                    
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical)
            .offset(y: -130)
            .padding(.bottom, -130)
        }
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView(product:   Product(title: "Chicken Pizza", imageURL: "chickenPizzaWithBellPeppersTomatoCheese", price: 25, description: "chicken Pizza With Bell Peppers, Tomato and Cheese", category: .pizza, isFavorite: false, components: [.cheese, .onione, .tomato]))
            .frame(height: 300)
    }
}


