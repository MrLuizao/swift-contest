//
//  TableViewCell.swift
//  contest
//
//  Created by LKY on 24/04/20.
//  Copyright © 2020 LKY. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)

        // Configure the view for the selected state
    }

}
