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
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

