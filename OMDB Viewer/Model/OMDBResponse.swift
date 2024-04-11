//
//  OMDBResponse.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-11.
//

import Foundation

struct SearchResult: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.imdbID = try container.decode(String.self, forKey: .imdbID)
        self.type = try container.decode(String.self, forKey: .type)
        self.poster = try container.decode(String.self, forKey: .poster)
    }
}

struct Rating: Codable {
    let source: String
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(String.self, forKey: .source)
        self.value = try container.decode(String.self, forKey: .value)
    }
}

struct OMDBResponse: Codable {
    let search: [SearchResult]?
    let title: String?
    let year: String?
    let rated: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let awards: String?
    let poster: String?
    let ratings: [Rating]?
    let metascore: String?
    let imdbRating: String?
    let imdbVotes: String?
    let imdbID: String?
    let type: String?
    let dvd: String?
    let boxOffice: String?
    let production: String?
    let website: String?
    let totalResults: Int?
    let response: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case search = "Search"
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating
        case imdbVotes
        case imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case totalResults
        case response = "Response"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.search = try? container.decode([SearchResult].self, forKey: .search)
        self.title = try? container.decode(String.self, forKey: .title)
        self.year = try? container.decode(String.self, forKey: .year)
        self.rated = try? container.decode(String.self, forKey: .rated)
        self.released = try? container.decode(String.self, forKey: .released)
        self.runtime = try? container.decode(String.self, forKey: .runtime)
        self.genre = try? container.decode(String.self, forKey: .genre)
        self.director = try? container.decode(String.self, forKey: .director)
        self.writer = try? container.decode(String.self, forKey: .writer)
        self.actors = try? container.decode(String.self, forKey: .actors)
        self.plot = try? container.decode(String.self, forKey: .plot)
        self.language = try? container.decode(String.self, forKey: .language)
        self.country = try? container.decode(String.self, forKey: .country)
        self.awards = try? container.decode(String.self, forKey: .awards)
        self.poster = try? container.decode(String.self, forKey: .poster)
        self.ratings = try? container.decode([Rating].self, forKey: .ratings)
        self.metascore = try? container.decode(String.self, forKey: .metascore)
        self.imdbRating = try? container.decode(String.self, forKey: .imdbRating)
        self.imdbVotes = try? container.decode(String.self, forKey: .imdbVotes)
        self.imdbID = try? container.decode(String.self, forKey: .imdbID)
        self.type = try? container.decode(String.self, forKey: .type)
        self.dvd = try? container.decode(String.self, forKey: .dvd)
        self.boxOffice = try? container.decode(String.self, forKey: .boxOffice)
        self.production = try? container.decode(String.self, forKey: .production)
        self.website = try? container.decode(String.self, forKey: .website)
        
        if let totalResults = try? container.decode(String.self, forKey: .totalResults) {
            self.totalResults = Int(totalResults)
        } else {
            self.totalResults = nil
        }
        
        let responseString = try container.decode(String.self, forKey: .response)
        self.response = responseString == "True"
    }
}
