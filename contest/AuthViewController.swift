//
//  ViewController.swift
//  contest
//
//  Created by LKY on 16/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit
//se importa la librería para realizar autenticación de usuarios
import FirebaseAuth


class AuthViewController: UIViewController {
    
//se declaran los elementos de la vista
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginDataView: UIView!
    @IBOutlet weak var loginUserLineView: UIView!
    @IBOutlet weak var loginPassLineView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logginButton: UIButton!
    @IBOutlet weak var registryButton: UIButton!
    
//variables para los colores en el view controller
    private let primaryColor = UIColor(displayP3Red: 154/255, green: 60/255, blue: 187/255, alpha: 1)
    private let secondaryColor = UIColor(displayP3Red: 251/255, green: 52/255, blue: 72/255, alpha: 1)
    private let tertiaryColor = UIColor(displayP3Red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    private let standarColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//se crea método para reconocer gestos al hacer tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AuthViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
//se inicializan los elementos asociados a la vista
        logginButton.layer.cornerRadius = 3
        logginButton.backgroundColor = primaryColor
        logginButton.setTitleColor(standarColor, for: .normal)
        registryButton.setTitleColor(primaryColor, for: .normal)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
//se asignan ediciones a la vista antes de mostarse
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override public func viewWillDisappear(_ animated: Bool) {
//se asignan ediciones a la vista antes de ocultarse
        self.navigationController?.isNavigationBarHidden = false
        super.viewWillDisappear(animated)
    }
    
//función para esconder el teclado al hacer tap
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//método para realizar un login de usuarios
    @IBAction func logginButtonAction(_ sender: Any) {
        
        if let email = userTextField.text, let password = passTextField.text{

            Auth.auth().signIn(withEmail: email, password: password){
                (result, error) in

                if let result = result, error == nil{
                    self.navigationController?
                        .pushViewController(ListViewController(email: result.user.email!, provider: .basic),animated: true)
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

//método para realizar un registro de usuarios
    @IBAction func registryButtonAction(_ sender: Any) {
        
        if let email = userTextField.text, let password = passTextField.text{

            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in

                if let result = result, error == nil{
                    self.navigationController?
                        .pushViewController(ListViewController(email: result.user.email!, provider: .basic),animated: true)

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
