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
    
    var image = UIImage(named: "vegeta.jpeg")
    var first_name = ""
    var last_name = ""
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        nameLabel.text = first_name
        lastnameLabel.text = last_name
        emailLabel.text = email
        
    }


}
