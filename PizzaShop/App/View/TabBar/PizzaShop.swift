//
//  PizzaShop.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 30.06.23.
//

import SwiftUI

struct PizzaShop: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSignInView {
              TabBar(showSignInView: $showSignInView)
              //  ProductsView()
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthenticationView(showSignInView: $showSignInView)
            }
        }
    }
}

struct PizzaShop_Previews: PreviewProvider {
    static var previews: some View {
        PizzaShop()
    }
}
