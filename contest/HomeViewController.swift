//
//  HomeViewController.swift
//  contest
//
//  Created by LKY on 17/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
import FirebaseAuth

enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var closeSessionButton: UIButton!
    
    private let email: String
    private let provider: ProviderType
    
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
        
        title = "Lista de Usuarios"
        
    }
    
    @IBAction func closeSessionButtonAction(_ sender: Any) {
        switch provider {
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch{
                //Ejecutar funcionalidad cuando se produce un error
            }
        }
    }
    

}
