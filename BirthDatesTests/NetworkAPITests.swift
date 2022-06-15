//
//  NetworkAPITests.swift
//  BirthDatesTests
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import XCTest
import Apollo
@testable import BirthDates

class NetworkAPITests: XCTestCase {

    var sut: NetworkLib!
    let networkMonitor = NetworkMonitor.shared
    var apollo: ApolloClient?
    override func setUpWithError() throws {
        let urlString = "https://birthday-api.hasura.app/v1/graphql"
        sut = NetworkLib(urlStr: urlString)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCallBirthdaysAPI() throws {
        try XCTSkipUnless(
          networkMonitor.isReachable,
          "Network connectivity needed for this test.")
        let promise = expectation(description: "Completion handler invoked")
        sut.callBirthdaysAPI { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                promise.fulfill()
            case .failure(errorStr: let err, _):
                XCTFail("Error: \(err)")
            }
        }
        wait(for: [promise], timeout: 5)
    }
}
