//
//  DetailsViewModelTests.swift
//  OMDB ViewerTests
//
//  Created by Greg Rodrigues on 2024-04-14.
//

import XCTest
@testable import OMDB_Viewer

final class DetailsViewModelTests: XCTestCase {

    func testGetMovies() async {
        let viewModel = DetailsViewModel(searchResult: SearchResult.sharedSearchExample)
        
        await viewModel.loadMovie("tt0848228")
        print("\(viewModel.movieDetails)")
        XCTAssertNotEqual(viewModel.state, .error)
        XCTAssertNotNil(viewModel.movieDetails)
        XCTAssertEqual(viewModel.movieDetails?.title, "The Avengers")
    }

    
}
