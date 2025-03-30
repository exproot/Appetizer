//
//  ContentView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerTabView: View {

  @EnvironmentObject private var order: Order

  var body: some View {
    TabView {
      AppetizerListView()
        .tabItem {
          Label("Home", systemImage: "house")
        }

      AppetizerAccountView()
        .tabItem {
          Label("Account", systemImage: "person")
        }

      AppetizerOrderView()
        .tabItem {
          Label("Order", systemImage: "bag")
        }
        .badge(order.items.count)
    }
    .tint(.accentColor)
  }
}

#Preview {
  AppetizerTabView()
}
