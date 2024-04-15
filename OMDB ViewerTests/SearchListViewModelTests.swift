//
//  SearchListViewModelTests.swift
//  OMDB ViewerTests
//
//  Created by Greg Rodrigues on 2024-04-14.
//

import XCTest
@testable import OMDB_Viewer

final class SearchListViewModelTests: XCTestCase {

    func testGetMovies() async {
        let viewModel = SearchListViewModel()

        await viewModel.loadMovies("Avengers")
        print("\(viewModel.results)")
        XCTAssertTrue(viewModel.results.count > 0)
        XCTAssertNotEqual(viewModel.state, .error)
    }
    
    func testEmptyListText() {
        let viewModel = SearchListViewModel()

        viewModel.errorMessage = nil
        XCTAssertEqual(viewModel.emptyListText, "No movies found.  Please enter a search term above.")
        
        viewModel.errorMessage = "Test"
        XCTAssertEqual(viewModel.emptyListText, "Test")

    }
}
