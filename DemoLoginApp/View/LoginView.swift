//
//  LoginView.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    @State var moveToHome = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack (spacing: 20) {
                    TextField("UserName", text: $viewModel.username)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    NavigationLink(destination: HomeScreen(), isActive: $moveToHome) {
                        Button("Login") {
                           
                            if !viewModel.username.isEmpty, !viewModel.password.isEmpty {
                                viewModel.login(username: viewModel.username, password: viewModel.password) { _, _ in
                                    
                                    UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                                    moveToHome = true
                                }
                            } else {
                                viewModel.showAlert = true
                            }
                            
                           

                        }.padding()
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(10)
                    }
                    
                }
                Spacer()
            }.padding(40)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("Enter Valid Input"),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
           
    }
}

#Preview {
    LoginView()
}
