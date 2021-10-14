//
//  ApproveReview.swift
//  GBShop
//
//  Created by Анастасия Живаева on 06.10.2021.
//

import Foundation
import Alamofire

class ApproveReview: AbstractRequestFactory {
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

extension ApproveReview: ApproveReviewRequestFactory {
    func approveReview(idComment: Int, completionHandler: @escaping (AFDataResponse<ApproveReviewResult>) -> Void) {
        let requestModel = Review(baseUrl: baseUrl,
                                  idComment: idComment)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ApproveReview {
    struct Review: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "approveReview.json"
        let idComment: Int
        var parameters: Parameters? {
            return ["id_comment": idComment]
        }
    }
}
