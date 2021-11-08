//
//  UserResult.swift
//  GBShop
//
//  Created by Анастасия Живаева on 28.09.2021.
//

import Foundation

struct UserResult: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
