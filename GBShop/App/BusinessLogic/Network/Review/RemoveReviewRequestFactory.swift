//
//  RemoveReviewRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 06.10.2021.
//

import Foundation
import Alamofire

protocol RemoveReviewRequestFactory {
    func removeReview(idComment: Int, completionHandler: @escaping(AFDataResponse<RemoveReviewResult>) -> Void)
}
