//
//  CardProductRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 30.09.2021.
//

import Foundation
import Alamofire

protocol CardProductRequestFactory {
    func cardProduct(idProduct: Int, completionHandler: @escaping(AFDataResponse<CardProductResult>) -> Void)
}
