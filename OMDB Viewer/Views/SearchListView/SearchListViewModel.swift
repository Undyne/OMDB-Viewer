//
//  SearchListViewModel.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-12.
//

import Foundation
import Combine

enum ListState  {
    case loading
    case loaded
    case error
}

class SearchListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var results: [SearchResult] = []
    @Published var state: ListState = .loaded
    @Published var showError: Bool = false

    private var currentPage: Int = 1
    private var totalResults: Int? = nil
    var errorMessage: String? = nil
    private var bag = Set<AnyCancellable>()

    init() {
        $searchTerm
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .debounce(for: 1.0, scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                print("Firing debounced search term: \(value)")
                self?.currentPage = 1
                Task { [weak self] in
                    await self?.loadMovies(value)
                }
            })
            .store(in: &bag)
    }
    
    func loadNextPage() {
        if results.count < (totalResults ?? 0),
            state != .loading {
            currentPage += 1
            Task { [weak self] in
                guard let searchTerm = self?.searchTerm else { return }
                await self?.loadMovies(searchTerm)
            }
        }
    }
    
    func loadMovies(_ term: String) async {
        guard !term.isEmpty else {
            await MainActor.run { [weak self] in
                self?.results = []
            }
            return
        }
    
        await MainActor.run { [weak self] in
            self?.state = .loading
        }
        do {
            let response = try await NetworkAccess.shared.getMovies(parameters: ["s" : term, "page" : "\(currentPage)"])
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                self.state = .loaded
                if self.currentPage == 1 {
                    self.results = response.search ?? []
                } else {
                    self.results.append(contentsOf: response.search ?? [])
                }
                self.errorMessage = response.error
                self.totalResults = response.totalResults
            }
        } catch {
            state = .error
            showError.toggle()
        }
    }
    
    var emptyListText: String {
        errorMessage ?? "No movies found.  Please enter a search term above."
    }
}
