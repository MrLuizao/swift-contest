//
//  ViewController.swift
//  contest
//
//  Created by LKY on 16/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
import FirebaseAuth


class AuthViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginDataView: UIView!
    @IBOutlet weak var loginUserLineView: UIView!
    @IBOutlet weak var loginPassLineView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logginButton: UIButton!
    @IBOutlet weak var registryButton: UIButton!
    
    private let primaryColor = UIColor(displayP3Red: 154/255, green: 60/255, blue: 187/255, alpha: 1)
    private let secondaryColor = UIColor(displayP3Red: 251/255, green: 52/255, blue: 72/255, alpha: 1)
    private let tertiaryColor = UIColor(displayP3Red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    private let standarColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AuthViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        logginButton.layer.cornerRadius = 3
        logginButton.backgroundColor = primaryColor
        logginButton.setTitleColor(standarColor, for: .normal)
        registryButton.setTitleColor(primaryColor, for: .normal)
    }
    
    @objc func dismissKeyboard() {
        //Las vistas y toda la jerarquía renuncia a responder, para esconder el teclado
        view.endEditing(true)
    }
    
    @IBAction func logginButtonAction(_ sender: Any) {
        
        if let email = userTextField.text, let password = passTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in

                if let result = result, error == nil{
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic),animated: true)
                }else{
                    let alertController = UIAlertController(
                        title: "Error",
                        message: "Error al iniciar sesión",
                        preferredStyle: .alert)

                    alertController.addAction( UIAlertAction(
                        title: "Aceptar", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

    }

   
    @IBAction func registryButtonAction(_ sender: Any) {
        
        if let email = userTextField.text, let password = passTextField.text{

            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in

                if let result = result, error == nil{
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic),animated: true)

                }else{
                    let alertController = UIAlertController(
                        title: "Error",
                        message: "Error en el registro",
                        preferredStyle: .alert)

                    alertController.addAction( UIAlertAction(
                        title: "Aceptar", style: .default))

                    self.present(alertController, animated: true, completion: nil)
                }

            }
        }
    }
    
}

