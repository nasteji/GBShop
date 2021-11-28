//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Анастасия Живаева on 27.09.2021.
//

import XCTest

class GBShopUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        setupSnapshot(app)
        app.launch()
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
    }

        func testExample() throws {
            snapshot("LoginScreen")
            
            let app = XCUIApplication()
            let textField = app.textFields["пароль"]
            textField.tap()
            textField.tap()
            app/*@START_MENU_TOKEN@*/.staticTexts["Войти"]/*[[".buttons[\"Войти\"].staticTexts[\"Войти\"]",".staticTexts[\"Войти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            
            snapshot("ProfileScreen")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
