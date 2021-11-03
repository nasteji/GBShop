//
//  AppDelegate.swift
//  GBShop
//
//  Created by Анастасия Живаева on 27.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - Authorization
//        let auth = requestFactory.makeAuthRequestFatory()
//        auth.login(userName: "Somebody", password: "mypassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
        // MARK: - Getting a list of products
//        let getProductList = requestFactory.makeProductsListRequestFactory()
//        getProductList.productsList(pageNumber: 1, idCategory: 1) { response in
//            switch response.result {
//            case .success(let productList):
//                print(productList)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        // MARK: - Getting a card product
        let getCardProduct = requestFactory.makeCardProductRequestFactory()
        getCardProduct.cardProduct(idProduct: 123) { response in
            switch response.result {
            case .success(let product):
                print(product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - Adding a review
        let requestAddReview = requestFactory.makeAddReviewRequestFactory()
        requestAddReview.addReview(idUser: 123, text: "Текст отзыва") { response in
            switch response.result {
            case .success(let review):
                print(review)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - Review approval
        let requestApproveReview = requestFactory.makeApproveReviewRequestFactory()
        requestApproveReview.approveReview(idComment: 123) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - Removing a review
        let requestRemoveReview = requestFactory.makeRemoveReviewRequestFactory()
        requestRemoveReview.removeReview(idComment: 123) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - Adding an item to the basket
        let requestAddToBasket = requestFactory.makeAddToBasketRequestFactory()
        requestAddToBasket.addtoBasket(idProduct: 123, quantity: 1) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: - Removing an item from the basket
        let requestDeleteFromBasket = requestFactory.makeDeleteFromBasketRequestFactory()
        requestDeleteFromBasket.deleteFromBasket(idProduct: 123) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

