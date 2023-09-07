//
//  CartIsEmptyView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 18.05.23.
//

import SwiftUI

struct CartIsEmptyView: View {
    var body: some View {
        VStack(spacing: 30) {
            
            Text("No Items added")
                .font(.body)
                .fontWeight(.semibold)
            
            Text("Hit the plus button to save into basket.")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.top, 10)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            NavigationLink {
                ProductsView()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .padding(.vertical,20)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangleShape(color: .greenDarkTextColor, radius: 25)
                            .padding(.horizontal)
                    )
            }.padding(.bottom, 35)

            
           

        }
        .padding(.top, 20)
        .background(
            Image("Pizza")
                .resizable()
                .aspectRatio(contentMode: .fill))
    }
}

struct CartIsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CartIsEmptyView()
    }
}
