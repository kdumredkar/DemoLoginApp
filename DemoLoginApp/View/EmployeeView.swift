//
//  EmployeeView.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import SwiftUI
import SwiftData

struct EmployeeView: View {
    @Query private var employees: [EmployeeModel]
    var body: some View {
        VStack {
            if employees.count == 0 {
                
                Text("No Employee Found").font(.largeTitle)
                
            } else {
                List {
                    ForEach(employees) { employee in
                        EmployeeRow(employee: employee)
                    }
                }
            }
           
        }
       
    }
}



struct EmployeeRow: View {
    let employee: EmployeeModel
    var body: some View {
        VStack(spacing: 10) {
       
                Text("Name: \(employee.name)").font(.caption).foregroundColor(.blue).multilineTextAlignment(.center)
                Text("Age: \(employee.age)").font(.caption).foregroundColor(.blue).multilineTextAlignment(.center)
                Text("Address: \(employee.address)").font(.caption).foregroundColor(.blue).multilineTextAlignment(.center)
                Text("City: \(employee.name)").font(.caption).foregroundColor(.blue).multilineTextAlignment(.center)
            
            
        }
    }
}

#Preview {
    EmployeeView()
}
