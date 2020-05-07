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



//extension UIView {
//  func kHolderViewTag() -> Int {
//    return self.hash
//  }
//
//  func kIndicatorViewTag() -> Int {
//    return self.hash / 100;
//  }
//
//  func kProgressViewTag() -> Int {
//    return self.hash / 1000
//  }
//
//  func showLoadingIndicator() {
//    if (self.superview?.viewWithTag(self.kHolderViewTag()) != nil) {
//      let overlayView = UIView(frame: self.frame)
//      overlayView.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
//      overlayView.tag = self.kHolderViewTag()
//      overlayView.layer.cornerRadius = self.layer.cornerRadius
//
//      let indicator = UIActivityIndicatorView(frame: self.frame)
//      indicator.tag = self.kIndicatorViewTag()
//
//      self.superview?.addSubview(overlayView)
//      self.superview?.addSubview(indicator)
//      indicator.startAnimating()
//    }
//  }
//
//  func hideLoadingIndicator() {
//    if (self.superview != nil) {
//
//      if let overlayView = self.superview?.viewWithTag(self.kHolderViewTag()) {
//        overlayView.removeFromSuperview()
//      }
//
//      if let indicator = self.superview?.viewWithTag(self.kIndicatorViewTag()) {
//        indicator.removeFromSuperview()
//      }
//    }
//  }
//}
