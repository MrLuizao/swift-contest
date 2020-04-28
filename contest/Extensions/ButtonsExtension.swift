//
//  CustomButtons.swift
//  contest
//
//  Created by LKY on 27/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

extension UIButton {
    
    func loginBTN() {

        layer.cornerRadius = 3
        backgroundColor = CustomColor().primaryColor
        setTitleColor(CustomColor().standarColor, for: .normal)

    }

}
