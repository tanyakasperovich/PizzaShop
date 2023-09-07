//
//  PizzaViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 7.09.23.
//

import SwiftUI

import CoreData
import Foundation


class PizzaViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var favoritesPizza: [FavoritesEntity] = []
    
    init() {
        getFavoritesPizza()
    }
    
    func getFavoritesPizza() {
        let request = NSFetchRequest<FavoritesEntity>(entityName: "FavoritesEntity")
        do {
            favoritesPizza = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addFavoritePizza(name: String, price: Int, image: String, isFavorite: Bool) {
          let newFavoritesPizza = FavoritesEntity(context: manager.context)
        newFavoritesPizza.name = name
        newFavoritesPizza.price = Int16(price)
        newFavoritesPizza.image = image
        newFavoritesPizza.isFavorite = isFavorite
          save()
      }

    func deleteFavoritePizza(isFavorite: Bool) {
        let favoritesPizza = favoritesPizza[1]
        favoritesPizza.isFavorite = isFavorite
        manager.context.delete(favoritesPizza)
        save()
    }
    
    func save() {
        manager.save()
    }
}
