//
//  NetworkAPITests.swift
//  BirthDatesTests
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import XCTest
@testable import BirthDates

class NetworkAPITests: XCTestCase {

    var sut: NetworkLib!
    override func setUpWithError() throws {
        sut = NetworkLib()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCallBirthdaysAPI() throws {
        let expect = XCTestExpectation(description: "callback")
        sut.callBirthdaysAPI { result in
            expect.fulfill()
            switch result {
            case .success(let personArr):
                XCTAssertNotNil(personArr)
            case .failure(errorStr: let err, _):
                XCTFail(err)
            }
        }
        wait(for: [expect], timeout: 3.1)
    }
}
