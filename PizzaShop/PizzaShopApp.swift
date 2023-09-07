//
//  PizzaShopApp.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 2.05.23.
//

import SwiftUI
import FirebaseCore

@main
struct PizzaShopApp: App {
    // MARK: - PROPERTIEW
    //
    @AppStorage("isOnboarding") var isOnboarding: Bool = true

    @StateObject var catalogViewModel: CatalogViewModel = CatalogViewModel()
    
    //Firebase...
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if !isOnboarding {
               PizzaShop()
            } else {
                OnboardingView()
            }
        }
    }
}

//WindowGroup {
//    if isOnboarding {
//        OnboardingView()
//        } else if isAuth {
//      AuthView()
//        } else {
//            TabBar()
//        }
//}

//Firebase...
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
    return true
  }
}
