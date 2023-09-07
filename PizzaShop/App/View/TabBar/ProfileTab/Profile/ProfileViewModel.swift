//
//  ProfileViewModel.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 11.09.23.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: AuthDataResultModel? = nil
    
    func loadCurrentUser() throws {
        self.user = try AuthenticationManager.shared.getAuthenticatedUser()
    }
}
