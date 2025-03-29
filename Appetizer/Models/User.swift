//
//  User.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 29.03.2025.
//

import Foundation

struct User: Codable {
  var firstName: String = ""
  var lastName: String = ""
  var email: String = ""
  var birthdate: Date = Date()
  var extraNapkins: Bool = false
  var frequentRefills: Bool = false
}
