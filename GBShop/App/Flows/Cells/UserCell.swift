//
//  UserCell.swift
//  GBShop
//
//  Created by Анастасия Живаева on 19.10.2021.
//

import UIKit

class UserCell: UITableViewCell {
    
    static let reuseID = "UserCell"
    
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
