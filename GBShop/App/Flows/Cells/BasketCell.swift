//
//  BasketCell.swift
//  GBShop
//
//  Created by Анастасия Живаева on 08.11.2021.
//

import UIKit

class BasketCell: UITableViewCell {
    
    static let reuseID = "BasketCell"

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(product: Product) {
        nameLabel.text = product.name
        priceLabel.text = String(product.price)
        photoImageView.image = UIImage(named: "noFoto")
    }
    
}
