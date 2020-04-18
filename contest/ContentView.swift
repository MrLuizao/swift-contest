//
//  ContentView.swift
//  contest
//
//  Created by LKY on 18/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var employeListVM = EmployeeListViewModel()
    
    var body: some View{
        
        List(self.employeListVM.employees, id: \.email){ employee in

            Text(employee.name)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
