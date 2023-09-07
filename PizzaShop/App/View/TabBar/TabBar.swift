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
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        TabView() {
            CatalogView()
                    .tabItem {
                        Label("Menu", systemImage: "menucard.fill")
                    }
            
            NavigationStack {
                ProductsView()
            }
                    .tabItem {
                        Label("Catalog", systemImage: "list.star")
                    }
            
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }
            
            CartView(viemModel: CartViewModel.shared)
                .badge(badgeCount)
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

            NavigationStack {
                ProfileView(showSignInView: $showSignInView)
            }
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
        .accentColor(.burgundy)
       // .tabViewStyle(.automatic)

    }
        
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(showSignInView: .constant(false))
            .environmentObject(CatalogViewModel())
    }
}
