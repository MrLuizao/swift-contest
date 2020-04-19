//
//  ListViewController.swift
//  contest
//
//  Created by LKY on 18/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

//se declara el tipo de autenticación
enum ProviderType: String {
    case basic
}

class ListViewController: UIViewController, UITableViewDataSource{

//declaracion de los elementos y variables
    private let email: String
    private let provider: ProviderType
    private let primaryColor = UIColor(displayP3Red: 154/255, green: 60/255, blue: 187/255, alpha: 1)
    
    private var employeListVM = EmployeeListViewModel()
    
//constructor que inicializa los elementos para la autenticación
       init (email: String, provider: ProviderType){
           self.email = email
           self.provider = provider
           super.init(nibName: nil, bundle: nil)
       }
    required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
    
//elemento que carga el table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "Esta es la celda: \(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() { //inicia ciclo de vida de la app
        super.viewDidLoad()
        
//se establecen opciones para los elemntos de la barra de navegación
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = "Lista de Empleados"
        
    }
    

//método para cerrar sesión
//    @IBAction func closeSessionButtonAction(_ sender: Any) {
//        switch provider {
//        case .basic:
//            do{
//                try Auth.auth().signOut()
//                navigationController?.popViewController(animated: true)
//            }catch{
//                //TO DO: funcionalidad cuando se produce un error
//            }
//        }
//    }
    
}
