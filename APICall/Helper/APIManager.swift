//
//  APIManager.swift
//  APICall
//
//  Created by Anil on 13/04/25.
//

import Foundation

enum APIError : Error {
    case invalidURL
    case invalidResponse
}

 final class APIManager {
    
     func request<T: Decodable>(url: String) async throws -> T {
         guard let url = URL(string: url) else {
             throw APIError.invalidURL
         }
         let (data, response) = try await URLSession.shared.data(from: url)
         guard (response as? HTTPURLResponse)?.statusCode == 200 else {
             throw APIError.invalidResponse
         }
         return try JSONDecoder().decode(T.self, from: data)
     }
    
}
