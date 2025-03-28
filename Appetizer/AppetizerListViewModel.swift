//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import Foundation

class AppetizerListViewModel: ObservableObject {

  @Published var appetizers: [Appetizer] = []

  func getAppetizers() {
    NetworkManager.shared.getAppetizers {  [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let appetizers):
          self?.appetizers = appetizers
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}
