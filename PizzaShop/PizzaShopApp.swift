//
//  PizzaShopApp.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 2.05.23.
//

import SwiftUI

@main
struct PizzaShopApp: App {
    @ObservedObject var viewModel: CatalogViewModel = CatalogViewModel()
    
    init() {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            viewModel.isLogin = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isLogin {
                TabBar()
                    .environmentObject(viewModel)
            } else {
                AuthView()
                    .environmentObject(viewModel)
            }
               
        }
    }
}
