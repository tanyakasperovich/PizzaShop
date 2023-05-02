//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 4.05.23.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    @Published var isLogin = false
    
    var products = [
        Product(title: "Chicken Pizza", imageURL: "chickenPizzaWithBellPeppersTomatoCheese", price: 25, description: "chicken Pizza With Bell Peppers, Tomato and Cheese", category: .pizza, isFavorite: false, components: [.cheese, .onione, .tomato]),
        Product(title: "Pepperoni Pizza", imageURL: "pepperoniPizzaWithMushrooms", price: 20, description: "Pepperoni Pizza With Mushrooms", category: .pizza, isFavorite: false, components: [.cheese, .onione, .sal]),
        Product(title: "Grant Pizza", imageURL: "pizzaWithTomatoesSalamiAndOlives", price: 12, description: "Pizza With Tomatoes Salami And Olives", category: .pizza, isFavorite: false, components: [.cheese, .tomato, .sal, .oliva]),
        
        Product(title: "Крылья барбекю", imageURL: "", price: 25, description: "Крылья барбекю", category: .zakuski, isFavorite: false, components: []),
        Product(title: "Картофель фри", imageURL: "", price: 5, description: "Salad with chiken", category: .zakuski, isFavorite: false, components: []),
        Product(title: "Salad with chiken", imageURL: "salad", price: 15, description: "Salad with chiken", category: .zakuski, isFavorite: false, components: []),
        
        
        Product(title: "Coca-Cola", imageURL: "pizza", price: 20, description: "Coca-Cola", category: .napitok, isFavorite: false, components: []),
        Product(title: "Coca-Cola Cherry", imageURL: "pizza", price: 20, description: "Coca-Cola", category: .napitok, isFavorite: false, components: []),
        
        Product(title: "Вафли", imageURL: "Cake3", price: 12, description: "Вафли с карамелью", category: .dessert, isFavorite: false, components: []),
        Product(title: "Брауни", imageURL: "Cake1", price: 12, description: "Вафли с карамелью", category: .dessert, isFavorite: false, components: []),
        Product(title: "Чизкейк", imageURL: "Cake2", price: 12, description: "Вафли с карамелью", category: .dessert, isFavorite: false, components: []),
    ]
    
}
