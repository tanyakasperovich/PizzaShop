//
//  CircleShape.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 23.05.23.
//

import SwiftUI

struct CircleShape: View {
    var color: Color
  
    
    var body: some View {
        Circle()
              .foregroundColor(color)
              .shadow(color: color.opacity(0.6),radius: 4, x: -4, y: 4)
              .overlay(
                Circle()
                    .stroke(color, lineWidth: 4)
                      .shadow(color: Color.white, radius: 6, x: 7, y: 7)
              )
              .overlay(
                Circle()
                    .stroke(color, lineWidth: 4)
                      .shadow(radius: 6, x: -7, y: -7)
              )
              .clipShape(Circle())
    }
}

struct CircleShape_Previews: PreviewProvider {
    static var previews: some View {
        CircleShape(color: Color.greenDarkTextColor)
    }
}
