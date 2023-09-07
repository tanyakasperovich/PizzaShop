//
//  Position.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 18.05.23.
//

import Foundation

struct Position: Identifiable {
    var id: String = UUID().uuidString
    var product: ProductDB
    var count: Int
    var productSize: Size
    
    var cost: Double {
        
        return Double(product.price ?? 0) * Double(self.count)
        
    }
    
}

