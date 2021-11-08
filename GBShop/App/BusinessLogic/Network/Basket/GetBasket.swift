//
//  GetBasket.swift
//  GBShop
//
//  Created by Анастасия Живаева on 08.11.2021.
//

import Foundation
import Alamofire

class GetBasket: AbstractRequestFactory {
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

extension GetBasket: GetBasketRequestFactory {
    func getBasket(idUser: Int, completionHandler: @escaping (AFDataResponse<GetBasketResult>) -> Void) {
        let requestModel = Basket(baseUrl: baseUrl,
                                  idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetBasket {
    struct Basket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getBasket.json"
        let idUser: Int
        var parameters: Parameters? {
            return ["id_user": idUser]
        }
    }
}
