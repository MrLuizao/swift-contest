//
//  DetailViewController.swift
//  contest
//
//  Created by LKY on 21/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var avatar = ""
    var first_name = ""
    var last_name = ""
    var email = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let imageUrl:URL = URL(string: avatar) else {
            return
        }
        
        imageView.loadImge(withUrl: imageUrl)
        nameLabel.text = first_name
        lastnameLabel.text = last_name
        emailLabel.text = email
        
    }

}

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

