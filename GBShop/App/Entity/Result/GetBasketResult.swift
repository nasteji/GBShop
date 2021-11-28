//
//  GetBasketResult.swift
//  GBShop
//
//  Created by Анастасия Живаева on 08.11.2021.
//

import Foundation

struct GetBasketResult: Codable {
    let amount: Int
    let countGoods: Int
    let contents: [Product]
}
