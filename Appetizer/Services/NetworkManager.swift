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

  func getAppetizers() async throws -> [Appetizer] {
    guard let url = URL(string: appetizersURL) else {
      throw AppetizerError.invalidURL
    }

    let (data, _) = try await URLSession.shared.data(from: url)

    do {
      return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
    } catch {
      throw AppetizerError.invalidData
    }
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
