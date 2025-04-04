//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import Foundation

@MainActor
class AppetizerListViewModel: ObservableObject {

  @Published var appetizers: [Appetizer] = []
  @Published var alertItem: AlertItem?
  @Published var isLoading = false
  @Published var isShowingDetail = false
  @Published var selectedAppetizer: Appetizer?

  func getAppetizers() {
    isLoading = true

    Task {
      do {
        appetizers = try await NetworkManager.shared.getAppetizers()
        isLoading = false
      } catch {
        if let error = error as? AppetizerError {
          switch error {
          case .invalidURL:
            alertItem = AlertContext.invalidURL
          case .invalidResponse:
            alertItem = AlertContext.invalidResponse
          case .invalidData:
            alertItem = AlertContext.invalidData
          case .unableToComplete:
            alertItem = AlertContext.unableToComplete
          }
        } else {
          alertItem = AlertContext.invalidResponse
        }

        isLoading = false
      }
    }
  }
}
