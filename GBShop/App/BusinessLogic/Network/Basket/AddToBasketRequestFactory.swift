//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 10.10.2021.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addtoBasket(idProduct: Int, quantity: Int, completionHandler: @escaping(AFDataResponse<AddToBasketResult>) -> Void)
}
