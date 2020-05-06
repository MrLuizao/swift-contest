//
//  RegistryViewController.swift
//  contest
//
//  Created by LKY on 05/05/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistryViewController: UIViewController {

    @IBOutlet weak var registryBtn: UIButton!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
            let authViewController = AuthViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registryBtn.loginBTN()
        
    }
    
    @IBAction func registryActionBtn(_ sender: Any) {

        _ = UIStoryboard(name: "Main", bundle: nil)
        
        if let registMail = userTextField.text, let registPass = passTextField.text{

            Auth.auth().createUser(withEmail: registMail, password: registPass) {
                (result, error) in
                if let _ = result, error == nil{
                    
                    let alertController = UIAlertController(
                        title: "Usuario creado.",
                        message: "Ve a la pantalla de inicio de sesión",
                        preferredStyle: .alert)

                    alertController.addAction( UIAlertAction(
                        title: "Aceptar", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                    
                    self.userTextField.text = nil
                    self.passTextField.text = nil

                }else{
                    let alertController = UIAlertController(
                        title: "Error al crear registro",
                        message: "Ingresa los campos solicitados",
                        preferredStyle: .alert)

                    alertController.addAction( UIAlertAction(
                        title: "Aceptar", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}
