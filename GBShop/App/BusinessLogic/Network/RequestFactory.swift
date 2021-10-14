//
//  RequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 28.09.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    // MARK: - Authorization
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    // MARK: - Product
    func makeProductsListRequestFactory() -> ProductsListRequestFactory {
        let errorParser = makeErrorParser()
        return GetListOfProducts(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeCardProductRequestFactory() -> CardProductRequestFactory {
        let errorParser = makeErrorParser()
        return GetCardProduct(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    // MARK: - Reviews
    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeApproveReviewRequestFactory() -> ApproveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ApproveReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

