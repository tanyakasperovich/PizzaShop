//
//  ProductDetailViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: ProductDB
   // @Published var sizes: [Size] = Size.allCases
    @Published var count = 1
    
    
    init(product: ProductDB) {
        self.product = product
    }
    
    func getPrice(size: Size) -> Double {
     
        switch size {
        case .small:
            return Double(product.price ?? 0)
        case .medium:
            return Double(product.price ?? 0) * 1.25
        case .large:
            return Double(product.price ?? 0) * 1.5
        }
   }
    
}

enum Size: String, CaseIterable {
    case small = "Маленькая"
    case medium = "Средняя"
    case large = "Большая"
}
