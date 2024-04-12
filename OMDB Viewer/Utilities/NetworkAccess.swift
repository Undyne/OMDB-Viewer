//
//  NetworkAccess.swift
//  Pelmorex Coding Challenge
//
//  Created by Greg Rodrigues on 2024-03-23.
//

import Foundation

enum ServerError: Error {
    case urlError
    case serverError
}

class NetworkAccess {
    
    static let shared: NetworkAccess = {
        var networkAccess = NetworkAccess.init()
        return networkAccess
    }()
    
    private init () {
        
    }
    
    var baseURL: String = "https://www.omdbapi.com/"
    
    func getMovies(parameters: [String:String]) async throws -> OMDBResponse {
        print("running getMovies")
        
        var queryItems = parameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        queryItems.append(URLQueryItem(name: "apikey", value: apiKey))
        
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw ServerError.urlError
        }
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            throw ServerError.urlError
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ServerError.serverError
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        print("Server response:  \(String(data: data, encoding: .utf8) ?? "nil")")
        let serverResponse = try decoder.decode(OMDBResponse.self, from: data)
        return serverResponse
    }
}
