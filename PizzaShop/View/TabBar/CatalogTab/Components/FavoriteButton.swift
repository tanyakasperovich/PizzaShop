//
//  FavoriteButton.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? Color.redDarkTextColor : Color.cardBackgroundDark)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
