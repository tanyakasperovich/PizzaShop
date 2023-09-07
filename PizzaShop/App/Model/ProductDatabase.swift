//
//  ProductDatabase.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 30.06.23.
//

import Foundation

struct ProductArray: Codable {
    let products: [ProductDB]
    let total, skip, limit: Int
}

struct ProductDB: Identifiable, Codable, Equatable {
    let id: Int
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
    
    static func ==(lhs: ProductDB, rhs: ProductDB) -> Bool {
        return lhs.id == rhs.id
    }
    
}



