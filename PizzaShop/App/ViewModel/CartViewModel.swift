//
//  CartViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 18.05.23.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() { }
    
    @Published var positions = [Position]()
    
    var cost: Double {
        
        var sum = 0.00
        
        for pos in positions {
            sum += pos.cost
        }
        
        return sum
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
