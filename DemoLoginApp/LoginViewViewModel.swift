//
//  LoginViewViewModel.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import Foundation


class LoginViewViewModel : ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var showAlert = false
    
    
    
    
    func login(username: String, password: String, completion: @escaping (Bool, String?) -> Void)  {
        
        
        let url = URL(string: "https://reqres.in/api/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let param: [String: Any] = [
            "email" : username,
            "password": password
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: param)
        
        request.httpBody = jsonData
        
        
       URLSession.shared.dataTask(with: request) { data, response, error in
           let data = try! JSONDecoder().decode(LoginResponse.self, from: data!)
           print(data.token)
           completion(true, data.token)
       }.resume()
        
    }
    
}


struct LoginResponse: Codable {
    var token: String
}
