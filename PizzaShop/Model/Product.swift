//
//  Product.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import Foundation

struct Product: Hashable, Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let imageURL: String
    let price: Int
    let description: String
    let category: Category
    var isFavorite: Bool
    let components: [Components]
    
//    let orderCount: Int
//    let isRecommend: Bool
}

enum Category: String, CaseIterable {
    case pizza = "Пицца"
    case zakuski = "Закуски"
    case soys = "Соусы"
    case napitok = "Напитки"
    case dessert = "Десерты"
}

enum Components: String, CaseIterable  {
    case cheese = "Сыр"
    case sal = "Колбаса"
    case onione = "Лук"
    case oliva = "Оливки"
    case tomato = "Томат"
    case mush = "Грибы"
    
    var image: String {
        switch self {
        case .cheese:
            return "cheese"
        case .sal:
            return "sal"
        case .onione:
            return "onion"
        case .oliva:
            return "oliva"
        case .tomato:
            return "tomato"
        case .mush:
            return "mush"
        }
    }
}

enum Size: String, CaseIterable {
    case small = "Маленькая"
    case medium = "Средняя"
    case large = "Большая"
}
