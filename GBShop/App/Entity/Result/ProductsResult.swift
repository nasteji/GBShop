//
//  ProductsResult.swift
//  GBShop
//
//  Created by Анастасия Живаева on 30.09.2021.
//

import Foundation

typealias ProductsResult = [Product]

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
