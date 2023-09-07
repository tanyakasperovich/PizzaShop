//
//  PositionCardView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 18.05.23.
//

import SwiftUI

struct PositionCardView: View {
    var position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title ?? "")
                .fontWeight(.bold)
            Text(position.productSize.rawValue)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text("\(position.count) шт.")
            Text("\(position.cost) $")
                .frame(width: 85, alignment: .trailing)
        }.padding(.horizontal)
    }
}

//struct PositionCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PositionCardView(position: Position(product: ProductDB(id: 1, title: "Test", description: "test", price: 435, discountPercentage: 1345245, rating: 65231, stock: 1324, brand: "asdfasdf", category: "asdfafsd", thumbnail: "asdfafds", images: []))
//    }
//}
