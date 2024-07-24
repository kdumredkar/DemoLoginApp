//
//  HomeView.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewViewModel()
    @Environment(\.modelContext) private var modelContext
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    var body: some View {
        VStack(spacing: 30) {
            
            
            VStack {
                Text("User Profile")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("User Email : eve.holt@reqres.in")
                
                
                Button("Logout") {
                    isLoggedIn = false
                }.padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .frame(height: 20)
                    .cornerRadius(5)
                    
            }
            
            Divider()
            
            VStack(spacing: 10) {
                Text("Add Employee")
                    .font(.title2)
                    .fontWeight(.bold)
                
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Age", text: $viewModel.age)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                TextField("address", text: $viewModel.address)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("City", text: $viewModel.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                Spacer().frame(height: 20)
                
                Button("Add ") {
                    if !viewModel.name.isEmpty ,!viewModel.age.isEmpty, !viewModel.address.isEmpty, !viewModel.city.isEmpty {
                        addEmployee()
                    } else {
                        viewModel.alertTitle = "Error"
                        viewModel.alertMessage = "Enter Valid Input"
                        viewModel.showAlert = true
                    }
                  
                }.padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                
            }.padding(.horizontal, 30)
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(viewModel.alertTitle),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    
    func addEmployee() {
        let newItem = EmployeeModel(name: viewModel.name, age: viewModel.age, address: viewModel.address, city: viewModel.city)
        modelContext.insert(newItem)
        viewModel.alertTitle = "Success"
        viewModel.alertMessage = "Employee Added sussfully"
        viewModel.showAlert = true
        viewModel.clearField()
    }
    
   
}

#Preview {
    HomeView()
}
