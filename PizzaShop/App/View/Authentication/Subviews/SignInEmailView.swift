//
//  SignInEmailView.swift
//  PizzaShop
//
//  Created by Татьяна Касперович on 2.05.23.
//

import SwiftUI

struct SignInEmailView: View {
    //firebase...
        @StateObject private var viewModel = SignInEmailViewModel()
        @Binding var showSignInView: Bool
    
    
    @State private var isAuthPage = true
    
//    @State private var email = ""
//    @State private var password = ""
    @State private var confirmPassword = ""
  //  @AppStorage("isLogin") var isLogin: Bool?
    
    var body: some View {
        VStack(spacing: 15) {
            Text(isAuthPage ? "Авторизация" : "Регистрация")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(RoundedRectangleShape(color: .burgundy, radius: 25))
                .foregroundColor(.white)
            
            VStack(spacing: 16) {
                TextField("Введите Email", text: $viewModel.email)
                    .padding()
                    .background(Color.white.cornerRadius(12))
                   
                    
                SecureField("Введите пароль", text: $viewModel.password)
                    .padding()
                    .background(Color.white.cornerRadius(12))
                
                if !isAuthPage {
                    SecureField("Повторить пароль", text: $confirmPassword)
                        .padding()
                        .background(Color.white.cornerRadius(12))
                }
              
                Button {
                    if isAuthPage {
                        print("Авторизация пользователя через Firebase")

                    //firebase...
                        Task {
                            do {
                                try await viewModel.signIn()
                                showSignInView = false
                                return
                            } catch {
                                print(error)
                            }
                        }
                        
                        
                    } else {
                        Task {
                            do {
                                try await viewModel.signUp()
                                showSignInView = false
                                return
                            } catch {
                                print(error)
                            }
                        }
                        
                        
//                        self.viewModel.email = ""
//                        self.viewModel.password = ""
//                        self.confirmPassword = ""
                       self.isAuthPage.toggle()
                    }
                } label: {
                    Text(isAuthPage ? "Войти" : "Создать аккаунт")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangleShape(color: .burgundy, radius: 15))
                        .padding(.top, 5)
                }
                
                Button {
                    isAuthPage.toggle()
                } label: {
                    Text(isAuthPage ? "Ещё не с нами?" : "Уже есть аккаунт!")
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 26)
            .padding(.horizontal, 16)
            .background(Color.burgundy.opacity(0.7).cornerRadius(12))
            .padding()
            
            Spacer()
        }
        .foregroundColor(Color.greenDarkTextColor)
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Image("Pizza").resizable().aspectRatio( contentMode: .fit).ignoresSafeArea())
//       .background(
//        BackgroundView()
//        .blur(radius: isAuthPage ? 0 : 7)
//        )
       .animation(Animation.easeInOut(duration: 0.2), value: isAuthPage)
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInEmailView(showSignInView: .constant(false))
    }
}
