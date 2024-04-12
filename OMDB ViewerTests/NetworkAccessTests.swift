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

    func testGetMovies() async throws {
        let data = try await NetworkAccess.shared.getMovies(parameters: ["i" : "tt3896198"])
        print("\(data)")
        XCTAssertEqual(data.imdbID, "tt3896198")
    }
}
