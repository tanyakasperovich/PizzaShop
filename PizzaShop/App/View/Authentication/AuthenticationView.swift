//
//  AuthenticationView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 24.05.23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
        var body: some View {
            VStack(spacing: 20) {
                Button(action: {
                    Task {
                        do {
                            try await viewModel.signInAnonymous()
                            showSignInView = false
                        } catch {
                            print(error)
                        }
                    }
                }, label: {
                    Text("Sign In Anonymously")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangleShape(color: Color.burgundy, radius: 8))
                        .cornerRadius(10)
                })
                
                NavigationLink {
                    SignInEmailView(showSignInView: $showSignInView)
                } label: {
                    Text("Sign In With Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangleShape(color: Color.greenDarkTextColor, radius: 8))
                        .cornerRadius(10)
                }
                
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            showSignInView = false
                        } catch {
                            print(error)
                        }
                    }
                }
                
                // Apple.....
                Button {
                    Task {
                        do {
                            try await viewModel.signInApple()
                            showSignInView = false
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    SignInWithAppleButtonViewRepresentable(type: .default, style: .black)
                        .allowsHitTesting(false)
                }
                .frame(height: 55)
                
       
                
                Spacer()
            }
            .padding()
            .navigationTitle("Sign In")
        }
    }


    struct AuthenticationView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                AuthenticationView(showSignInView: .constant(false))
            }
           
        }
    }
