//
//  HomeViewController.swift
//  contest
//
//  Created by LKY on 17/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
//se importa la librería para realizar autenticación de usuarios
import FirebaseAuth

//se declara el tipo de autenticación
enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {
    
//declaracion de los elementos y variables
    
    @IBOutlet weak var closeSessionButton: UIButton!

    private let email: String
    private let provider: ProviderType
    
//constructor que inicializa los elementos para la autenticación
    init (email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//se establecen opciones para los elemntos de la barra de navegación
        self.navigationItem.setHidesBackButton(true, animated: false)
        title = "Lista de Usuarios"
    }
    
//método para cerrar sesión
    @IBAction func closeSessionButtonAction(_ sender: Any) {
        switch provider {
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                //TO DO: funcionalidad cuando se produce un error
            }
        }
    }
    
}

