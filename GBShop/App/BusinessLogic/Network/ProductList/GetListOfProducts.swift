//
//  GetListOfProducts.swift
//  GBShop
//
//  Created by Анастасия Живаева on 30.09.2021.
//

import Foundation
import Alamofire

class GetListOfProducts: AbstractRequestFactory {
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

extension GetListOfProducts: ProductsListRequestFactory {
    func productsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<ProductsResult>) -> Void) {
        let requestModel = ProductList(baseUrl: baseUrl,
                                       pageNumber: pageNumber,
                                       idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler) }
    }

extension GetListOfProducts {
    struct ProductList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return ["page_number": pageNumber, "id_category": idCategory]
        }
    }
}
