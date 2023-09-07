//
//  FavoriteView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject private var vm = PizzaViewModel()
    @State var isSet = true
    @StateObject private var favoriteProductsVM = FavoriteProductsViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.favoritesPizza, id: \.self) { product in
                HStack(alignment: .top, spacing: 12) {
                    
                    AsyncImage(url: URL(string: product.image ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 75, height: 75)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(product.name ?? "")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Spacer()
                            Button(action: {
                                isSet = false
                                vm.deleteFavoritePizza(isFavorite: isSet)
                                vm.getFavoritesPizza()
                               
                            }) {
                                Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(product.isFavorite ? Color.redDarkTextColor : Color.cardBackgroundDark)
                            }
                        }
                        
//                        Text("Price: $" + String(product.price))
//                        Text("Rating: " + String(product.rating))
//                        Text("Category: " + (product.category))
//                        Text("Brand: " + (product.brand))
                    }
                    .font(.callout)
                    .foregroundColor(.secondary)
                }
            }
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
