//
//  CardProductResult.swift
//  GBShop
//
//  Created by Анастасия Живаева on 30.09.2021.
//

import Foundation

struct CardProductResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String

    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
