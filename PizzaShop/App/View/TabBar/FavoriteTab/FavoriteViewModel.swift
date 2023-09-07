//
//  FavoriteViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 11.09.23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

@MainActor
final class FavoriteProductsViewModel: ObservableObject {
    
    
    @Published private(set) var favoriteProducts: [UserFavoriteProduct] = []
    
    
    
    
}
