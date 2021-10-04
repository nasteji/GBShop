//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Анастасия Живаева on 28.09.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
