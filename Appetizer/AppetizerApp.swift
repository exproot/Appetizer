//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

@main
struct AppetizerApp: App {

  var order = Order()

  var body: some Scene {
    WindowGroup {
      AppetizerTabView()
        .environmentObject(order)
    }
  }
}
