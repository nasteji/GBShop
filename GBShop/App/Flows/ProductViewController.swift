//
//  ProductViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 03.11.2021.
//

import UIKit
import Firebase

class ProductViewController: UIViewController {

    @IBOutlet weak var imageProductView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let requestFactory = RequestFactory()
    var idProduct = Int()
    var cardProduct = CardProductResult(result: 0, productName: "", productPrice: 0, productDescription: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCardProduct()
    }
    
    func getCardProduct() {
        let getCardProduct = requestFactory.makeCardProductRequestFactory()
        getCardProduct.cardProduct(idProduct: idProduct) { [self] response in
            switch response.result {
            case .success(let product):
                self.cardProduct = product
                Analytics.logEvent("getCardProduct", parameters: ["success": true])
                DispatchQueue.main.async {
                    self.configure()
                }
            case .failure(let error):
                Analytics.logEvent("getCardProduct", parameters: ["success": false])
                print(error.localizedDescription)
            }
        }
    }
    
    func configure() {
        nameLabel.text = cardProduct.productName
        priceLabel.text = String("Цена: \(cardProduct.productPrice)")
        descriptionLabel.text = cardProduct.productDescription
        imageProductView.image = UIImage(named: "noFoto")
    }
    
}
