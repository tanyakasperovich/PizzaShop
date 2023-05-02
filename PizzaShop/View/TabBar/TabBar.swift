//
//  TabBar.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 2.05.23.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject var viewModel: CatalogViewModel
    
    @State private var badgeCount = 2
    
    var body: some View {
        
        TabView() {
            CatalogView()
                    .tabItem {
                        Label("Menu", systemImage: "menucard.fill")
                    }
            
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }
            
            CartView()
                .badge(badgeCount)
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(.burgundy)
       // .tabViewStyle(.automatic)
    }
        
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(CatalogViewModel())
    }
}
