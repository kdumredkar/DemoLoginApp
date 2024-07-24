//
//  SplashScreen.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        VStack {
            if isActive {
                if isLoggedIn {
                    HomeScreen()
                } else {
                    LoginView()
                }
                
               
            } else {
                
                ZStack {
                    
                    Color.teal
                        .ignoresSafeArea()
                    
                    Image(systemName: "pencil.tip.crop.circle.badge.minus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
