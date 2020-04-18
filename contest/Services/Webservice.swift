 //
//  Webservice.swift
//  contest
//
//  Created by LKY on 18/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import Foundation

 class Webservice {
    
    func getEmployees(completion: @escaping ([Employee]?) -> ()) {
         
        guard let url = URL(string: "https://manage-visitors.azurewebsites.net/api/v1/employees") else{
            fatalError("URL No Valida")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let employees = try? JSONDecoder().decode([Employee].self, from: data)
            DispatchQueue.main.async {
                completion(employees)
            }
            
        }.resume()
    }
 }
