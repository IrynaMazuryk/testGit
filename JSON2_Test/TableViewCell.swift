//
//  TableViewCell.swift
//  JSON2_Test
//
//  Created by Itcrystal Mac on 06.12.17.
//  Copyright © 2017 Ira. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
