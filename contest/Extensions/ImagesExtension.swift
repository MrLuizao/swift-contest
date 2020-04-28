//
//  ImagesExtension.swift
//  contest
//
//  Created by LKY on 27/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func imageFromApi(withUrl url: URL) {
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
