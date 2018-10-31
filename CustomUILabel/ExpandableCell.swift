//
//  ExpandableCell.swift
//  CustomUILabel
//
//  Created by CPU11613 on 10/31/18.
//  Copyright © 2018 CPU11613. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {

    @IBOutlet weak var customLabel: CustomUILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        customLabel.collapsed = true
        customLabel.text = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
}
