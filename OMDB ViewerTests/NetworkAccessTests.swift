//
//  NetworkAccessTests.swift
//  OMDB ViewerTests
//
//  Created by Greg Rodrigues on 2024-04-11.
//

import XCTest
@testable import OMDB_Viewer

final class NetworkAccessTests: XCTestCase {

    let timeout = 10.0

    func testGetMovies() throws {
        let expectation = XCTestExpectation(description: "Response should return Guardians of the Galaxy Vol.2")
        
        NetworkAccess.shared.getMovies(parameters: ["i" : "tt3896198"], completion: { result in
            switch result {
            case .success(let data):
                print("\(data)")
                if data.imdbID == "tt3896198" {
                    expectation.fulfill()
                } else {
                    XCTFail("Data did not match")
                }
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        })

        wait(for: [expectation], timeout: timeout)
    }
}
