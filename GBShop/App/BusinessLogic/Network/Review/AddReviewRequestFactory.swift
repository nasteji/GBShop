//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 06.10.2021.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int, text: String, completionHandler: @escaping(AFDataResponse<AddReviewResult>) -> Void)
}
