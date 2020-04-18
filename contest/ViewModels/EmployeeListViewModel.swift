//
//  EmployeeListViewModel.swift
//  contest
//
//  Created by LKY on 18/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import Foundation


class EmployeeListViewModel: ObservableObject {
    @Published var employees = [EmployeeViewModel]()
    
    init() {
        Webservice().getEmployees { employees in
            
            if let employees = employees{
                self.employees = employees.map(EmployeeViewModel.init)
            }
        }
    }
}

struct EmployeeViewModel {
    var employee: Employee
    
    init(employee: Employee){
        self.employee = employee
    }
    
    var name: String{
        return self.employee.name
    }
    
    var email: String{
        return self.employee.email
    }
}

