//
//  DemoLoginAppApp.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import SwiftUI
import SwiftData

@main
struct DemoLoginAppApp: App {
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            EmployeeModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }.modelContainer(sharedModelContainer)
    }
}
