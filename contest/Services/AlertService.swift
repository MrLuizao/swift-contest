//
//  AlertService.swift
//  contest
//
//  Created by LKY on 12/05/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addUser(in vc: UIViewController, completion: @escaping(User) -> Void) {
        
        let alert = UIAlertController(title: "Agregar Usuario", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameTF) in
            nameTF.placeholder = "Nombre"
        }

        alert.addTextField { (ageTF) in
            ageTF.placeholder = "Edad"
            ageTF.keyboardType = .numberPad
        }
            
        let add = UIAlertAction (title: "Aceptar", style: .default) { _ in
            guard
                let name = alert.textFields?.first?.text,
                let ageString = alert.textFields?.last?.text,
                let age = Int(ageString)
            
                else {return}
            
            print(name)
            print(age)
            
            let user = User(name: name, age: age)
            completion(user)
        }
        
        alert.addAction(add)
        vc.present(alert, animated: true)
        
    }
    
    

}
