//
//  Date+Ext.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 30.03.2025.
//

import Foundation

extension Date {

  static func minimumAge() -> Date {
    Calendar.current.date(byAdding: .year, value: -18, to: Date())!
  }

  static func maximumAge() -> Date {
    Calendar.current.date(byAdding: .year, value: -100, to: Date())!
  }
}
