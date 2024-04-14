//
//  DetailsViewModel.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-13.
//

import Foundation

class DetailsViewModel: ObservableObject {
    let searchResult: SearchResult
    @Published var movieDetails: OMDBResponse? = nil
    @Published var state: ListState = .loading

    init(searchResult: SearchResult) {
        self.searchResult = searchResult
        Task { [weak self] in
            guard let searchTerm = self?.searchResult.imdbID else { return }
            await self?.loadMovie(searchTerm)
        }
    }
    
    func loadMovie(_ imdbID: String) async {
        await MainActor.run { [weak self] in
            self?.state = .loading
        }
        do {
            let response = try await NetworkAccess.shared.getMovies(parameters: ["i" : imdbID])
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                self.state = .loaded
                self.movieDetails = response
            }
        } catch {
            state = .error
        }
    }
    
    var title: String { movieDetails?.title ?? searchResult.title }
    var year: String? { movieDetails?.year ?? searchResult.year }
    var rated: String? { movieDetails?.rated }
    var released: String? { movieDetails?.released }
    var runtime: String? { movieDetails?.runtime }
    var genre: String? { movieDetails?.genre }
    var director: String? { movieDetails?.director }
    var writer: String? { movieDetails?.writer }
    var actors: String? { movieDetails?.actors }
    var plot: String? { movieDetails?.plot }
    var language: String? { movieDetails?.language }
    var country: String? { movieDetails?.country }
    var awards: String? { movieDetails?.awards }
    var poster: String? { movieDetails?.poster ?? searchResult.poster }
    var ratings: [Rating]? { movieDetails?.ratings }
    var metascore: String? { movieDetails?.metascore }
    var imdbRating: String? { movieDetails?.imdbRating }
    var imdbVotes: String? { movieDetails?.imdbVotes }
    var type: String? { movieDetails?.type ?? searchResult.type }
    var dvd: String? { movieDetails?.dvd }
    var boxOffice: String? { movieDetails?.boxOffice }
    var production: String? { movieDetails?.production }
    var website: String? { movieDetails?.website }
}
