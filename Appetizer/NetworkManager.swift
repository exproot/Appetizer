//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import Foundation

final class NetworkManager {

  static let shared = NetworkManager()
  static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
  private let appetizersURL = baseURL + "appetizers"

  private init() {}

  func getAppetizers(completion: @escaping (Result<[Appetizer], AppetizerError>) -> Void) {
    guard let url = URL(string: appetizersURL) else {
      completion(.failure(.invalidURL))
      return
    }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      if let _ = error {
        completion(.failure(.unableToComplete))
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)

        completion(.success(decodedResponse.request))
      } catch {
        completion(.failure(.invalidData))
      }
    }
    
    task.resume()
  }
}
