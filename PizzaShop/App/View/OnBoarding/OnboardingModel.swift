//
//  OnboardingModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 14.09.23.
//

import SwiftUI

// MARK: - Onboarding DATA MODEL

// Tab Model and sample Intro Tabs...
struct Tab: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var image: String
    var color: Color
}

// MARK: - TABS DATA
var tabs: [Tab] = [
    
    Tab(title: "Order dishes from the", subTitle: "Lunch menu", description: "View your collection route Follow, change or add to your route yourself", image: "Pic1", color: .burgundy),
    Tab(title: "Quick Waste", subTitle: "Pizza and Snacks", description: "Record oil collections easily and accurately. No more paper!", image: "Pic2", color: .greenDarkTextColor),
    Tab(title: "Choose your favorite", subTitle: "Pizza", description: "Know some restaurant who want to optimize oil collection? Invite them with one click", image: "Pic3", color: .cardBackground)
]
