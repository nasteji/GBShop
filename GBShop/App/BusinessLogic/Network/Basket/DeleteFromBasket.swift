//
//  DeleteFromBasket.swift
//  GBShop
//
//  Created by Анастасия Живаева on 10.10.2021.
//

import Foundation
import Alamofire

class DeleteFromBasket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string:"https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension DeleteFromBasket: DeleteFromBasketRequestFactory {
    func deleteFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = Basket(baseUrl: baseUrl,
                                  idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteFromBasket {
    struct Basket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"
        let idProduct: Int
        var parameters: Parameters? {
            return ["id_product": idProduct]
        }
    }
}
