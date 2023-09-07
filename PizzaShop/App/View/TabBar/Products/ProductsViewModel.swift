//
//  ProductsViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 30.06.23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

// ЗАГРУЗКА БД ПРОДУКТЫ......
@MainActor
final class ProductsViewModel: ObservableObject {

    
    @Published private(set) var products: [ProductDB] = []
    @Published var selectedFilter: FilterOption? = nil
    @Published var selectedCategory: CategoryOption? = nil
//    private var lastDocument: DocumentSnapshot? = nil
       
//       func getAllProducts() async throws {
//           self.products = try await ProductsManager.shared.getAllProducts()
//       }
    
    enum FilterOption: String, CaseIterable {
        case noFilter
        case priceHigh
        case priceLow

        var priceDescending: Bool? {
            switch self {
            case .noFilter: return nil
            case .priceHigh: return true
            case .priceLow: return false
            }
        }
    }
    func filterSelected(option: FilterOption) async throws {
//    switch option {
//    case .noFilter:
//        self.products = try await ProductsManager.shared.getAllProducts()
//    case .priceHigh:
//        self.products = try await ProductsManager.shared.getAllProductsSortedByPrice(descending: true)
//    case .priceLow:
//        self.products = try await ProductsManager.shared.getAllProductsSortedByPrice(descending: false)
//    }
    
    self.selectedFilter = option
//    self.products = []
//    self.lastDocument = nil
    self.getProducts()
}

    enum CategoryOption: String, CaseIterable {
   
    case pizza = "Pizza"
    case snacks = "Snacks"
    case desserts = "Desserts"
    case drinks = "Drinks"
    case other = "Other"
    case noCategory = "No Category"
        
    var categoryKey: String? {
        if self == .noCategory {
            return nil
        }
        return self.rawValue
    }
}

    func categorySelected(option: CategoryOption) async throws {
//    switch option {
//    case .noCategory:
//        self.products = try await ProductsManager.shared.getAllProducts()
//    case .smartphones, .laptops, .fragrances:
//        self.products = try await ProductsManager.shared.getAllProductsSForCategory(category: option.rawValue)
//    }
    
    self.selectedCategory = option
     
//    self.products = []
//    self.lastDocument = nil
    self.getProducts()
}

    func getProducts() {
        Task {
            self.products = try await ProductsManager.shared.getAllProducts(priceDescending: selectedFilter?.priceDescending, forCategory: selectedCategory?.rawValue)
        }
    }
    
}


