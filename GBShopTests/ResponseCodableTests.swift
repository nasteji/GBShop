//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Анастасия Живаева on 29.09.2021.
//

import XCTest
@testable import GBShop
import Alamofire

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
    
class ResponseCodableTests: XCTestCase {
    let expectation = XCTestExpectation()
    var errorParser: ErrorParserStub!
    
    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
    }
    
    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }
    
    // MARK: - Download And Parse
    func testShouldDownloadAndParse() {
        AF.request("https://jsonplaceholder.typicode.com/posts/1").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<PostStub>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    // MARK: - Getting a list of products
    func testGettingListOfProducts() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<ProductsResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    // MARK: - Getting a card product
    func testGettingCardProduct() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/getGoodById.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<CardProductResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    // MARK: - Adding a review
    func testAddReview() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/addReview.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<AddReviewResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    // MARK: - Review approval
    func testApproveReview() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/approveReview.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<ApproveReviewResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    // MARK: - Removing a review
    func testRemoveReview() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/removeReview.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<RemoveReviewResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    // MARK: - Adding an item to the basket
    func testAddToBasket() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/addToBasket.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<AddToBasketResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    // MARK: - Removing an item from the basket
    func testDeleteFromBasket() {
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/deleteFromBasket.json").responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<DeleteFromBasketResult>) in
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
