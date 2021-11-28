//
//  GetBasketRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 08.11.2021.
//

import Foundation
import Alamofire

protocol GetBasketRequestFactory {
    func getBasket(idUser: Int, completionHandler: @escaping(AFDataResponse<GetBasketResult>) -> Void)
}
