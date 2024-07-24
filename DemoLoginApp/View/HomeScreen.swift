//
//  HomeScreen.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import SwiftUI

struct HomeScreen: View {
  
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            
            EmployeeView()
                .tabItem { Label("Employee,", systemImage: "person") }
            
        }
    }
}

#Preview {
    HomeScreen()
}

