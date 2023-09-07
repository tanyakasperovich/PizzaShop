//
//  FavoriteButton.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    @StateObject var favoritePizzaVM = PizzaViewModel()
    var produtc: ProductDB
    
    var body: some View {
        Button(action: {
            isSet.toggle()
            if isSet {
                favoritePizzaVM.addFavoritePizza(name: produtc.title ?? "", price: produtc.price ?? 0, image: produtc.thumbnail ?? "", isFavorite: true)
            } else {
                favoritePizzaVM.deleteFavoritePizza(isFavorite: false)
            }
            favoritePizzaVM.getFavoritesPizza()
            
        }) {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? Color.redDarkTextColor : Color.cardBackgroundDark)
        }
    }
}

//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton(isSet: .constant(true), produtc: <#ProductDB#>)
//    }
//}
