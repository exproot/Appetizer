//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import UIKit

final class NetworkManager {

  static let shared = NetworkManager()
  private let cache = NSCache<NSString, UIImage>()

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

  func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
    let cacheKey = NSString(string: urlString)

    if let image = cache.object(forKey: cacheKey) {
      completion(image)
      return
    }

    guard let url = URL(string: urlString) else {
      completion(nil)
      return
    }

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      guard let data = data, let image = UIImage(data: data) else {
        completion(nil)
        return
      }

      self.cache.setObject(image, forKey: cacheKey)
      completion(image)
    }

    task.resume()
  }
}
