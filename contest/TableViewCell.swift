//
//  TableViewCell.swift
//  contest
//
//  Created by LKY on 24/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

//clase que establece propiedades de las celdas en la tabla
class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//valores por defecto de las celdas
        super.setSelected(selected, animated: animated)
    }

}
