//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerListView: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(MockData.appetizers) { appetizer in
          AppetizerListItemView(appetizer: appetizer)
        }
      }
      .navigationTitle("Appetizers")
    }
  }
}

#Preview {
  AppetizerListView()
    .preferredColorScheme(.light)
}
