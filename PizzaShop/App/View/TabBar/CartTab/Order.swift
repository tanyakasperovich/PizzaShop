//
//  Order.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 23.06.23.
//

import SwiftUI

struct Order: View {
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSignInView {
            NavigationStack {
               // SettingsView(showSignInView: $showSignInView)
                DeliveryData()
            }
            }
        }
        .onAppear{
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
struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}
