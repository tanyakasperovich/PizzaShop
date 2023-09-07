//
//  ExtString.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 14.09.23.
//

import Foundation

extension String {
    func firstCharOnly() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }
}
