//
//  EmployeeModel.swift
//  DemoLoginApp
//
//  Created by Khiraj Umredkar on 24/07/24.
//

import Foundation
import SwiftData

@Model
final class EmployeeModel {
    var name: String
    var age: String
    var address: String
    var city: String
    
    init(name: String, age: String, address: String, city: String) {
        self.name = name
        self.age = age
        self.address = address
        self.city = city
    }
}
