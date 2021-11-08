//
//  BasketTableViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 08.11.2021.
//

import UIKit

class BasketTableViewController: UITableViewController {
    
    @IBOutlet weak var payButton: UIButton!
    @IBAction func payButtonAction(_ sender: UIButton) {
        products.removeAll()
        self.tableView.reloadData()
        payButton.setTitle("Корзина пуста", for: .normal)
    }
    
    let requestFactory = RequestFactory()
    var products = [Product]()
    var resultSumma = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BasketCell", bundle: nil), forCellReuseIdentifier: BasketCell.reuseID)
        
        getBasket()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.reuseID, for: indexPath) as! BasketCell
        cell.configure(product: products[indexPath.row])
        return cell
    }
    
    func getBasket() {
        let getBasketList = requestFactory.makeGetBasketRequestFactory()
        getBasketList.getBasket(idUser: 1){ response in
            switch response.result {
            case .success(let basketList):
                self.products = basketList.contents
                for i in 0..<self.products.count {
                    self.resultSumma += self.products[i].price
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.payButton.setTitle(String("Оплатить \(self.resultSumma)"), for: .normal)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
