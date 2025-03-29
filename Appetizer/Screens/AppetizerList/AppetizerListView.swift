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
    ZStack {
      NavigationView {
        List {
          ForEach(viewModel.appetizers) { appetizer in
            AppetizerListItemView(appetizer: appetizer)
              .onTapGesture {
                viewModel.selectedAppetizer = appetizer
                viewModel.isShowingDetail = true
              }
          }
        }
        .navigationTitle("Appetizers")
        .listStyle(.plain)
        .disabled(viewModel.isShowingDetail)
      }
      .onAppear {
        viewModel.getAppetizers()
      }
      .blur(radius: viewModel.isShowingDetail ? 20 : 0)

      if viewModel.isShowingDetail {
        AppetizerDetailsView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
      }

      if viewModel.isLoading {
        LoadingView()
      }
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
