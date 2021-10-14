//
//  DeleteFromBasketRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 10.10.2021.
//

import Foundation
import Alamofire

protocol DeleteFromBasketRequestFactory {
    func deleteFromBasket(idProduct: Int, completionHandler: @escaping(AFDataResponse<DeleteFromBasketResult>) -> Void)
}
