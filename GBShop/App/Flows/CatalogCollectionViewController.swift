//
//  CatalogCollectionViewController.swift
//  GBShop
//
//  Created by Анастасия Живаева on 03.11.2021.
//

import UIKit

class CatalogCollectionViewController: UICollectionViewController {
    
    let requestFactory = RequestFactory()
    var products = ProductsResult()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CatalogCell", bundle: nil), forCellWithReuseIdentifier: CatalogCell.reuseID)
        
        getProductList()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCell.reuseID, for: indexPath) as! CatalogCell
        cell.configure(product: products[indexPath.row])
        return cell
    }
    
    func getProductList() {
        let getProductList = requestFactory.makeProductsListRequestFactory()
        getProductList.productsList(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let productList):
                self.products = productList
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("bbbbbb")
                print(error.localizedDescription)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueToProductViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ProductViewController,
           let indexPath = collectionView.indexPathsForSelectedItems?.first {
            controller.idProduct = products[indexPath.row].id
        }
    }
    
   
}
