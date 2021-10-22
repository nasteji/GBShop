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
