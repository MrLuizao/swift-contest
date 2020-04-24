//
//  DetailViewController.swift
//  contest
//
//  Created by LKY on 21/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//se declaran los elementos de la vista
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
//se asigna un tipado a las variables
    var avatar = ""
    var first_name = ""
    var last_name = ""
    var email = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//se llama la funcion de la extension para convertir la url de la imagen
        guard let imageUrl:URL = URL(string: avatar) else {
            return
        }
        
//se establecen los valores a los elementos
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.loadImge(withUrl: imageUrl)
        nameLabel.text = first_name
        lastnameLabel.text = last_name
        emailLabel.text = email
        
    }

}

//extension que funciòn que convierte la url de la imagen en string
extension UIImageView {
    func loadImge(withUrl url: URL) {
       DispatchQueue.global().async { [weak self] in
           if let imageData = try? Data(contentsOf: url) {
               if let image = UIImage(data: imageData) {
                   DispatchQueue.main.async {
                       self?.image = image
                   }
               }
           }
       }
   }
}

