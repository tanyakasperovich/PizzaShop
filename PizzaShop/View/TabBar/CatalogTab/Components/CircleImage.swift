//
//  CircleImage.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 12.05.23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
       image
           .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.redDarkTextColor, lineWidth: 5))
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .overlay(Circle().stroke(Color.greenDarkTextColor, lineWidth: 1))
            .shadow(radius: 4)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("chickenPizzaWithBellPeppersTomatoCheese"))
    }
}
