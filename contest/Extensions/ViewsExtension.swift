//
//  ViewsExtension.swift
//  contest
//
//  Created by LKY on 06/05/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

fileprivate var activityView : UIView?

extension UIViewController {
    
    func showSpinner(){
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let actIndicator = UIActivityIndicatorView(style: .whiteLarge)
        actIndicator.center = activityView!.center
        actIndicator.startAnimating()
        activityView?.addSubview(actIndicator)
        self.view.addSubview(activityView!)
    }
    
    func removeSpinner(){
        activityView?.removeFromSuperview()
        activityView = nil
    }
    
}

