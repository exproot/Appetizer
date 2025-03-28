//
//  Alert.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AlertItem: Identifiable {
  let id = UUID()
  let title: Text
  let message: Text
  let dismissButton: Alert.Button
}

struct AlertContext {

  static let invalidURL = AlertItem(
    title: Text("Something Went Wrong"),
    message: Text("An error ocurred while connecting to the server."),
    dismissButton: .default(Text("Ok"))
  )

  static let invalidResponse = AlertItem(
    title: Text("Server Response Error"),
    message: Text("The response received from the server is invalid."),
    dismissButton: .default(Text("Ok"))
  )

  static let invalidData = AlertItem(
    title: Text("Server Error"),
    message: Text("The data received from the server is invalid."),
    dismissButton: .default(Text("Ok"))
  )

  static let unableToComplete = AlertItem(
    title: Text("Server Error"),
    message: Text("Unable to complete your request. Please check your internet connection."),
    dismissButton: .default(Text("Ok"))
  )
}
