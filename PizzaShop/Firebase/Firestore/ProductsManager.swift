//
//  ProductsManager.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 30.06.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ProductsManager {
    
    static let shared = ProductsManager()
    private init() { }
    
    private let productsCollection = Firestore.firestore().collection("products")
    
    private func productDocument(productId: String) -> DocumentReference {
        productsCollection.document(productId)
    }
    
    func uploadProduct(product: ProductDB) async throws {
        try productDocument(productId: String(product.id)).setData(from: product, merge: false)
    }
    
    func getProduct(productId: String) async throws -> ProductDB {
        try await productDocument(productId: productId).getDocument(as: ProductDB.self)
    }
    
    private func getAllProducts() async throws -> [ProductDB] {
            try await productsCollection
                .getDocuments(as: ProductDB.self)
        }
    
    private func getAllProductsSortedByPrice(descending: Bool) async throws -> [ProductDB] {
            try await productsCollection
            .order(by: ProductDB.CodingKeys.price.rawValue, descending: descending)
                .getDocuments(as: ProductDB.self)
        }
    private func getAllProductsSForCategory(category: String) async throws -> [ProductDB] {
            try await productsCollection
            .whereField(ProductDB.CodingKeys.category.rawValue, isEqualTo: category)
                .getDocuments(as: ProductDB.self)
        }
    private func getAllProductsByPriceAndCategory(descending: Bool, category: String) async throws -> [ProductDB] {
            try await productsCollection
                .whereField(ProductDB.CodingKeys.category.rawValue, isEqualTo: category)
                .order(by: ProductDB.CodingKeys.price.rawValue, descending: descending)
                .getDocuments(as: ProductDB.self)
        }
    func getAllProducts(priceDescending descending: Bool?, forCategory category: String?) async throws -> [ProductDB] {
        if let descending, let category {
            return try await getAllProductsByPriceAndCategory(descending: descending, category: category)
        } else if let descending {
            return try await getAllProductsSortedByPrice(descending: descending)
        } else if let category {
            return try await getAllProductsSForCategory(category: category)
        }
        
        return try await getAllProducts()
    }

}


