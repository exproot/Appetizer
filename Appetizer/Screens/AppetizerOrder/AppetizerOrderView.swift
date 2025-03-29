//
//  AppetizerOrderView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerOrderView: View {

  @State private var orderItems = MockData.orderAppetizers

  var body: some View {
    NavigationView {

      ZStack {
        VStack {
          List {
            ForEach(orderItems) { appetizer in
              AppetizerListItemView(appetizer: appetizer)
            }
            .onDelete(perform: deleteItem)
          }
          .listStyle(.plain)

          Button {

          } label: {
            AppetizerButton(title: "$30.97 - Place Holder")
          }
          .buttonStyle(.borderedProminent)
          .controlSize(.large)
          .tint(Color.green)
          .padding(.bottom, 40)
        }

        if orderItems.isEmpty {
          OrdersEmptyState(
            imageName: "empty-order",
            message: "You have no items in your order. \nPlease add an appetizer!"
          )
        }

      }
      .navigationTitle("Order")
    }
  }

  func deleteItem(at offsets: IndexSet) {
    orderItems.remove(atOffsets: offsets)
  }
}

#Preview {
  AppetizerOrderView()
}
