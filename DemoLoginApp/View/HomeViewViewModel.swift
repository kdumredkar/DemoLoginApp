//
//  HomeViewViewModel.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import Foundation

class HomeViewViewModel : ObservableObject {
    
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var address: String = ""
    @Published var city: String = ""
    
    
    @Published var alertTitle = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    
    func clearField() {
        name = ""
        age = ""
        address = ""
        city = ""
    }
    
}
