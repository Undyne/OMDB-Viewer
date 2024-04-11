//
//  NetworkAccess.swift
//  Pelmorex Coding Challenge
//
//  Created by Greg Rodrigues on 2024-03-23.
//

import Foundation

enum ServerError: Error {
    case error
}

class NetworkAccess {
    
    static let shared: NetworkAccess = {
        var networkAccess = NetworkAccess.init()
        return networkAccess
    }()
    
    private init () {
        
    }
    
    var baseURL: String = "https://www.omdbapi.com/"
    
    func getMovies(parameters: [String:String],  completion: @escaping (Result<OMDBResponse, Error>) -> ()) {
        print("running getMovies")
        
        var queryItems = parameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        queryItems.append(URLQueryItem(name: "apikey", value: apiKey))
        
        guard var urlComponents = URLComponents(string: baseURL) else {
            print("Unable to form URL. Exiting via guard")
            return
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            print("Unable to form URL. Exiting via guard")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("getMovies closure running")
            if let jsonData = data
            {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                do {
                    print("Server response:  \(String(data: jsonData, encoding: .utf8) ?? "nil")")
                    let serverResponse = try decoder.decode(OMDBResponse.self, from: jsonData)
                    completion(.success(serverResponse))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? ServerError.error))
            }
        }.resume()
    }
}
