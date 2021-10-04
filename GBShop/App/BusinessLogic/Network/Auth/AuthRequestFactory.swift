//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 28.09.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping(AFDataResponse<LoginResult>) -> Void)
}
