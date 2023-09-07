//
//  RoundedRectangleShape.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 18.05.23.
//

import SwiftUI

struct RoundedRectangleShape: View {
    var color: Color
    var radius: Int
    
    var body: some View {
        Rectangle()
            .cornerRadius(CGFloat(radius))
              .foregroundColor(color)
              .shadow(color: color.opacity(0.6),radius: 4, x: -4, y: 4)
              .overlay(
                  RoundedRectangle(cornerRadius: CGFloat(radius), style: .continuous)
                    .stroke(color, lineWidth: 4)
                      .shadow(color: Color.white, radius: 6, x: 7, y: 7)
              )
              .overlay(
                  RoundedRectangle(cornerRadius: CGFloat(radius), style: .continuous)
                    .stroke(color, lineWidth: 4)
                      .shadow(radius: 6, x: -7, y: -7)
              )
              .clipShape(RoundedRectangle(cornerRadius: CGFloat(radius), style: .continuous))
    }
}

struct RoundedRectangleShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleShape(color: Color.greenDarkTextColor, radius: 25)
    }
}
