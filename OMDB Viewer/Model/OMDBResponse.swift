//
//  OMDBResponse.swift
//  OMDB Viewer
//
//  Created by Greg Rodrigues on 2024-04-11.
//

import Foundation

struct SearchResult: Codable, Hashable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String?
    
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
        let poster = try? container.decode(String.self, forKey: .poster)
        self.poster = poster == "N/A" ? nil : poster
    }
    
    init(title: String,
         year: String,
         imdbID: String,
         type: String,
         poster: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
    
    static var sharedSearchExamples: [SearchResult] {
        [SearchResult.sharedSearchExample,
         SearchResult(title: "Avengers: Endgame", year: "2019", imdbID: "tt4154796", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg"),
         SearchResult(title: "Avengers: Infinity War", year: "2018", imdbID: "tt4154756", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_SX300.jpg"),
         SearchResult(title: "Avengers: Age of Ultron", year: "2015", imdbID: "tt2395427", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"),
        ]
    }
    
    static var sharedSearchExample: SearchResult {
        SearchResult(title: "The Avengers", year: "2012", imdbID: "tt0848228", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg")
    }
}

struct Rating: Codable, Hashable {
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
    
    init(source: String, value: String) {
        self.source = source
        self.value = value
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
    let error: String?
    
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
        case error = "Error"
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
        let poster = try? container.decode(String.self, forKey: .poster)
        self.poster = poster == "N/A" ? nil : poster
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
        self.error = try? container.decode(String.self, forKey: .error)

    }
    
    init(search: [SearchResult]? = nil,
         title: String? = nil,
         year: String? = nil,
         rated: String? = nil,
         released: String? = nil,
         runtime: String? = nil,
         genre: String? = nil,
         director: String? = nil,
         writer: String? = nil,
         actors: String? = nil,
         plot: String? = nil,
         language: String? = nil,
         country: String? = nil,
         awards: String? = nil,
         poster: String? = nil,
         ratings: [Rating]? = nil,
         metascore: String? = nil,
         imdbRating: String? = nil,
         imdbVotes: String? = nil,
         imdbID: String? = nil,
         type: String? = nil,
         dvd: String? = nil,
         boxOffice: String? = nil,
         production: String? = nil,
         website: String? = nil,
         totalResults: Int? = nil
    ) {
        self.search = search
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
        self.ratings = ratings
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
        self.type = type
        self.dvd = dvd
        self.boxOffice = boxOffice
        self.production = production
        self.website = website
        self.totalResults = totalResults
        self.response = true
        self.error = nil
    }
    
    static var sharedMovieExample: OMDBResponse {
        OMDBResponse(title: "Guardians of the Galaxy Vol. 2",
                     year: "2017",
                     rated: "PG-13",
                     released: "05 May 2017",
                     runtime: "136 min",
                     genre: "Action, Adventure, Comedy",
                     director: "James Gunn",
                     writer: "James Gunn, Dan Abnett, Andy Lanning",
                     actors: "Chris Pratt, Zoe Saldana, Dave Bautista",
                     plot: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father, the ambitious celestial being Ego.",
                     language: "English",
                     country: "United States",
                     awards: "Nominated for 1 Oscar. 15 wins & 60 nominations total",
                     poster: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg",
                     ratings: [Rating(source: "Internet Movie Database", value: "7.6/10"),
                               Rating(source: "Rotten Tomatoes", value: "85%"),
                               Rating(source: "Metacritic", value: "67/100")],
                     metascore: "67",
                     imdbRating: "7.6",
                     imdbVotes: "757,026",
                     imdbID: "tt3896198",
                     type: "movie",
                     dvd: "10 Jul 2017",
                     boxOffice: "$389,813,101",
                     production: "N/A",
                     website: "N/A")
    }
}
