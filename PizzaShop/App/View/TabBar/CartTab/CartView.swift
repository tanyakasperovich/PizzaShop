//
//  CartView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct CartView: View {
   @StateObject var viemModel: CartViewModel

    var body: some View {
        NavigationView {
            VStack {
            // checking if cartProducts are empty...
            if viemModel.positions.isEmpty{
                // В корзине пусто...
                CartIsEmptyView()
            }
            else{
                // В корзине есть предметы...
                CartIsFullView(viewModel: viemModel)
      
            }
         }
        .navigationTitle("Basket")
        .navigationBarTitleDisplayMode(.automatic)
        .navigationViewStyle(.stack)
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viemModel: CartViewModel.shared)
    }
}
