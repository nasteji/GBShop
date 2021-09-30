//
//  ProductsListRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 30.09.2021.
//

import Foundation
import Alamofire

protocol ProductsListRequestFactory {
    func productsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping(AFDataResponse<ProductsResult>) -> Void)
}
