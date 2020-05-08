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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AuthViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        logginButton.loginBTN()
        registryButton.setTitleColor(CustomColor().primaryColor, for: .normal)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override public func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        super.viewWillDisappear(animated)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func initSession(result: AuthDataResult?, error:Error?){
         
        if let _ = result, error == nil{
            self.removeSpinner()
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyBoard.instantiateViewController(withIdentifier: "table")
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }else{
            self.removeSpinner()
            
            let alertController = UIAlertController(
                title: "Error al iniciar sesión",
                message: "Ingresa correo y contraseña válidos",
                preferredStyle: .alert)

            alertController.addAction( UIAlertAction(
                title: "Aceptar", style: .default))

            self.present(alertController, animated: true, completion: nil)
        }
    }

    
    @IBAction func logginButtonAction(_ sender: Any) {
        
        if let loginMail = userTextField.text, let loginPass = passTextField.text{
            self.showSpinner()
            
            Auth.auth().signIn(withEmail: loginMail, password: loginPass){
                (result, error) in
                self.initSession(result: result, error: error)
            }
        }
    }

    @IBAction func registryButtonAction(_ sender: Any) {
    }
}

