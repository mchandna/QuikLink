//
//  AccountTableViewCell.swift
//  QuikLink
//
//  Created by Mitali Chandna on 2015-11-28.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initalization Code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Configure the view for the selected state
    }
    
}
