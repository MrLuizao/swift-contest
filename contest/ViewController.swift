//
//  ViewController.swift
//  contest
//
//  Created by LKY on 16/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginDataView: UIView!
    @IBOutlet weak var loginUserLineView: UIView!
    @IBOutlet weak var loginPassLineView: UIView!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logginButton: UIButton!
    @IBOutlet weak var forgottButton: UIButton!
    @IBOutlet weak var registryButton: UIButton!
    
    private let primaryColor = UIColor(displayP3Red: 154/255, green: 60/255, blue: 187/255, alpha: 1)
    private let secondaryColor = UIColor(displayP3Red: 251/255, green: 52/255, blue: 72/255, alpha: 1)
    private let tertiaryColor = UIColor(displayP3Red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
    private let standarColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logginButton.layer.cornerRadius = 3
        logginButton.backgroundColor = primaryColor
        logginButton.setTitleColor(standarColor, for: .normal)
        
        forgottButton.setTitleColor(primaryColor, for: .normal)
        registryButton.setTitleColor(secondaryColor, for: .normal)
    }

}

