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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//se instancia funcionalidad para reconocer gestos al hacer tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AuthViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
//se inicializan los elementos asociados a la vista
        logginButton.loginBTN()
        registryButton.setTitleColor(CustomColor().primaryColor, for: .normal)
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
    
//funcion que valida los datos y regresa un mensaje o navega al home al iniciar sesion
    private func initSession(result: AuthDataResult?, error:Error?){
         
        if let _ = result, error == nil{
                
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "table")
            self.navigationController?.pushViewController(viewController, animated: true)
            
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

    
//método para realizar un login de usuarios
    @IBAction func logginButtonAction(_ sender: Any) {
        
        if let loginMail = userTextField.text, let loginPass = passTextField.text{

            Auth.auth().signIn(withEmail: loginMail, password: loginPass){
                (result, error) in
                self.initSession(result: result, error: error)
            }
        }
    }

//método para realizar un registro de usuarios
    @IBAction func registryButtonAction(_ sender: Any) {
        
        if let registMail = userTextField.text, let registPass = passTextField.text{

            Auth.auth().createUser(withEmail: registMail, password: registPass) {
                (result, error) in
                 self.initSession(result: result, error: error)
            }
        }
    }
    
    
}

