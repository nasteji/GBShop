//
//  ApproveReviewRequestFactory.swift
//  GBShop
//
//  Created by Анастасия Живаева on 06.10.2021.
//

import Foundation
import Alamofire

protocol ApproveReviewRequestFactory {
    func approveReview(idComment: Int, completionHandler: @escaping(AFDataResponse<ApproveReviewResult>) -> Void)
}
