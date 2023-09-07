//
//  ProfileView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 3.05.23.
//

import SwiftUI

struct ProfileView: View {
    //FIREBASE...
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack {
        List {
            if let user = viewModel.user {
                Section(header: HStack() {
                    Image(systemName: "person")
                    Text("Profile")
                }.foregroundColor(.burgundy).bold()){
                    VStack {
                        Text("UserID: \(user.uid)")
                        
                        AsyncImage(url: URL(string: user.photoUrl ?? "")) { photo in
                            photo
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 75, height: 75)
                        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                    }
                    
                    NavigationLink {
                        SettingsView(showSignInView: $showSignInView)
                    } label: {
                        HStack {
//                            Image(systemName: "gear")
//                                .font(.headline)
                            Text("Settings")
                        }
                    }
                    
                    NavigationLink {
                        Text("Notification")
                    } label: {
                        HStack {
                            Text("Notification")
                        }
                    }
                    
                    NavigationLink {
                        Text("History Order")
                    } label: {
                        HStack {
                            Text("History Order")
                        }
                    }
                    
                }
                
                
           InfoView()
            
            }
        }
        .onAppear {
            try? viewModel.loadCurrentUser()
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Image(systemName: "gear")
                        .font(.headline)
                }
            }
        }
    }
    }

    @ViewBuilder
    func profileView()->some View {
      
        VStack(spacing: 20) {
         
                VStack {
                    
//                    ProfilePhotoView(image: <#UIImage#>)
//                        .padding(.top)
//                        .frame(width: 150)
//                        .zIndex(1)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            
                            Spacer()
                            
                            NavigationLink {
                                SettingsView(showSignInView: $showSignInView)
                            } label: {
                                Image(systemName: "gearshape")
                                    .font(.headline)
                            }
                        }
                        
                        Spacer(minLength: 55)
                        
              
                        
                        Text("User Name")
                            .bold()
                        
                        Text("+ 7 0000000000")
                            .padding(.bottom)
                        
                        Button {
                            //
                        } label: {
                            HStack(alignment: .top) {
                                Image(systemName: "location.square.fill")
                                VStack(alignment: .leading) {
                                    Text("Адрес доставки:")
                                        .lineLimit(1)
                                        .bold()
                                    
                                    Text("City, Street, 123 jhjkhjhjCity, Street, 123City, Street, 123City, Street, 123City, Street, 123City, Street, 123City, Street, 123")
                                        .lineLimit(2)
                                }
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    //.padding(.top, 90)
                    .padding()
                    .foregroundColor(.burgundy)
                    .background(RoundedRectangleShape(color: .white, radius: 20))
                    .offset(y: -90)
                    .padding(.horizontal)
                }
                .offset(y: -80)
                .padding(.bottom, -160)
                
                VStack(spacing: 1) {
                    Section(header: HStack() {
                        Image(systemName: "person")
                        Text("Профиль")
                    }.foregroundColor(.white).bold()) {
                        VStack {
                            NavigationLink {
                                Text("Notification")
                            } label: {
                                Text("Notification")
                            }
                            
                            NavigationLink {
                                Text("History Order")
                            } label: {
                                Text("History Order")
                            }
                        }

                    }
                }
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showSignInView: .constant(false))
            .environmentObject(CatalogViewModel())
    }
}

//struct LeadingNavigationBarProfileView: View {
//    var body: some View {
//            HStack {
//                Button {
//
//                } label: {
//                    Image(systemName: "info.circle")
//                }
//            }
//    }
//}
//
//
//struct TrailingNavigationBarProfileView: View {
//    @EnvironmentObject var viewModel: CatalogViewModel
//  @AppStorage("isLogin") var isLogin: Bool?
//
//    var body: some View {
//        HStack {
//            Button {
//           isLogin = false
//            } label: {
//                Image(systemName: "rectangle.portrait.and.arrow.right")
//            }
//
//        }
//    }
//}


