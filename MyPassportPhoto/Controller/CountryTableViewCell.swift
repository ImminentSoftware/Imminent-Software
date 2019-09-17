//
//  CountryTableViewCell.swift
//  MyPassportPhoto
//
//  Created by emitech990 on 13/09/19.
//  Copyright © 2019 Imminent Software. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet var img_flag: UIImageView!
    @IBOutlet var lblCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
