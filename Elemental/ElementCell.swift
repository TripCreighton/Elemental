//
//  ElementCell.swift
//  Elemental
//
//  Created by Trip Creighton on 2/27/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {

    @IBOutlet var elementName: UILabel!
    @IBOutlet var elementImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
