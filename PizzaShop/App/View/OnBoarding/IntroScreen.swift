//
//  IntroScreen.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 14.09.23.
//

import SwiftUI

struct IntroScreen: View {
    // MARK: - PROPERTIEW

    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    @State var currentIndex: Int = 0

    
    // MARK: - BODY
    var body: some View {
        ZStack{
            DotInversion(currentIndex: $currentIndex)
                .ignoresSafeArea()

            HStack(spacing: 10){
                
                ForEach(tabs.indices,id: \.self){index in
                   
                    CircleShape(color: .white)
                        .frame(width: 8, height: 8)
                        .opacity(currentIndex == index ? 1 : 0.3)
                        .scaleEffect(currentIndex == index ? 1.1 : 0.8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .padding(25)
            
            Button("Skip"){
                isOnboarding = false
            }
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
        }
    }
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen()
    }
}
