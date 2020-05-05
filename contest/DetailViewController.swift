//
//  DetailViewController.swift
//  contest
//
//  Created by LKY on 21/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
//se asigna un tipado a las variables
    var avatar : String = ""
    var first_name : String = ""
    var last_name : String = ""
    var email : String = ""
    
//se declaran los elementos de la vista
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        let completeName = first_name + "  " + last_name
        title = completeName
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear( animated )
//se valida el tipo de imagen para mostrarla en la vista
        guard let imageUrl:URL = URL(string: avatar) else {
            return
        }
        
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.imageFromApi(withUrl: imageUrl)
        nameLabel.text = first_name
        lastnameLabel.text = last_name
        emailLabel.text = email
    }

    @IBAction func backToList(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
}

