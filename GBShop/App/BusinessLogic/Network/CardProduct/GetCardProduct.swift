//
//  GetCardProduct.swift
//  GBShop
//
//  Created by Анастасия Живаева on 30.09.2021.
//

import Foundation
import Alamofire

class GetCardProduct: AbstractRequestFactory {
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

extension GetCardProduct: CardProductRequestFactory {
    func cardProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<CardProductResult>) -> Void) {
        let requestModel = CardProduct(baseUrl: baseUrl,
                                       idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler) }
    }

extension GetCardProduct {
    struct CardProduct: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        let idProduct: Int
        var parameters: Parameters? {
            return ["id_product": idProduct]
        }
    }
}
