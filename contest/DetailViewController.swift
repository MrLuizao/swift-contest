//
//  DetailViewController.swift
//  contest
//
//  Created by LKY on 21/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var avatar : String = ""
    var first_name : String = ""
    var last_name : String = ""
    var email : String = ""
    
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

