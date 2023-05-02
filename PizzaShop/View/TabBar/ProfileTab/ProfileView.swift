//
//  ProfileView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: CatalogViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Profile View!")
                    .padding()
                
                ProfilePhotoView()

            }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading:
                        LeadingNavigationBarProfileView()
                      ,
                    trailing:
                        TrailingNavigationBarProfileView()
                )
                .accentColor(.burgundy)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(CatalogViewModel())
    }
}

struct LeadingNavigationBarProfileView: View {
    var body: some View {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "info.circle")
                }
            }
    }
}


struct TrailingNavigationBarProfileView: View {
    @EnvironmentObject var viewModel: CatalogViewModel
    var body: some View {
        HStack {
            Button {
                UserDefaults.standard.set(false, forKey: "isLogin")
                viewModel.isLogin = false
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
            }
    
        }
    }
}


