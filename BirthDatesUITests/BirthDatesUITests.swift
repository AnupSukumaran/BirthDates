//
//  BirthDatesUITests.swift
//  BirthDatesUITests
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import XCTest

class BirthDatesUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
    }

    func testAppFlow() throws {
        
        let app = XCUIApplication()
        app.launch()

        let frontTxt = app.staticTexts["Birthdays"]
        XCTAssertTrue(frontTxt.exists)
        
        let homeNav = app.navigationBars["Birthdays"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: homeNav, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        if (app.tables.element(boundBy: 0).cells.count > 0) {
            app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
            let backBtn = app.buttons["GO BACK"]
            expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: backBtn, handler: nil)
            waitForExpectations(timeout: 5, handler: nil)
            backBtn.tap()
            
        }
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
