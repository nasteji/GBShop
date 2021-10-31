//
//  UserStorage.swift
//  GBShop
//
//  Created by Анастасия Живаева on 22.10.2021.
//

import Foundation

final class UserStorage {
    static let shared = UserStorage()
    
    private(set) var users: [User] = []
    
    func addUser(user: User) {
        users.append(user)
    }
}

final class User {
    let id: Int
    let login: String
    let password: String
    let name: String
    let lastname: String
    
    init(id: Int, login: String, password: String, name: String, lastname: String) {
        self.id = id
        self.login = login
        self.password = password
        self.name = name
        self.lastname = lastname
    }
}
