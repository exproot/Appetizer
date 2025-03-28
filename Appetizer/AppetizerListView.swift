//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerListView: View {

  @StateObject private var viewModel = AppetizerListViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.appetizers) { appetizer in
          AppetizerListItemView(appetizer: appetizer)
        }
      }
      .navigationTitle("Appetizers")
    }
    .onAppear {
      viewModel.getAppetizers()
    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(
        title: alertItem.title,
        message: alertItem.message,
        dismissButton: alertItem.dismissButton
      )
    }
  }
}

#Preview {
  AppetizerListView()
}
