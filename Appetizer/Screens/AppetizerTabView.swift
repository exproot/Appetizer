//
//  ContentView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerTabView: View {
  var body: some View {
    TabView {
      AppetizerListView()
        .tabItem {
          Image(systemName: "house")

          Text("Home")
        }

      AppetizerAccountView()
        .tabItem {
          Image(systemName: "person")

          Text("Account")
        }

      AppetizerOrderView()
        .tabItem {
          Image(systemName: "bag")

          Text("Order")
        }
    }
    .tint(.accentColor)
  }
}

#Preview {
  AppetizerTabView()
}
