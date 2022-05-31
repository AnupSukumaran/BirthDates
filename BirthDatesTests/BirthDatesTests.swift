//
//  BirthDatesTests.swift
//  BirthDatesTests
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import XCTest
@testable import BirthDates

class BirthDatesTests: XCTestCase {
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testGetInitials() throws {
        let initials = "Micah Mayer".getInitials()
        XCTAssertEqual(initials, "MM")
    }
    func testCheckDateFormate() throws {
        let date = "2020-05-31".convertDateFormate()
        XCTAssertEqual(date, "31-05-2020")
    }
    func testAgeValue() throws {
        let date = "2020-05-31".ageValue()
        XCTAssertEqual(date, "2 year(s) old")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


}
