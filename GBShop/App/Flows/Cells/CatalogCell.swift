//
//  CatalogCell.swift
//  GBShop
//
//  Created by Анастасия Живаева on 03.11.2021.
//

import UIKit

class CatalogCell: UICollectionViewCell {
    
    static let reuseID = "CatalogCell"
    
    @IBOutlet weak var imageProductView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    let requestFactory = RequestFactory()
    var idProduct = 0
    
    @IBAction func addToBasketButton(_ sender: UIButton) {
        let requestAddToBasket = requestFactory.makeAddToBasketRequestFactory()
        requestAddToBasket.addtoBasket(idProduct: idProduct, quantity: 1) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(product: Product) {
        numberLabel.text = String(product.id)
        nameLabel.text = product.name
        priceLabel.text = String("Цена: \(product.price)")
        imageProductView.image = UIImage(named: "noFoto")
        
        idProduct = product.id
    }
}
