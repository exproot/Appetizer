//
//  Appetizer.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
  let id: Int
  let name: String
  let description: String
  let price: Double
  let imageURL: String
  let calories: Int
  let protein: Int
  let carbs: Int
}

struct AppetizerResponse: Decodable {
  let request: [Appetizer]
}

struct MockData {

  static let sampleAppetizer = Appetizer(
    id: 001,
    name: "Test",
    description: "Description",
    price: 9.99,
    imageURL: "",
    calories: 88,
    protein: 88,
    carbs: 88
  )

  static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
