//
//  AppetizerOrderView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerOrderView: View {

  @EnvironmentObject private var order: Order

  var body: some View {
    NavigationView {

      ZStack {
        VStack {
          List {
            ForEach(order.items) { appetizer in
              AppetizerListItemView(appetizer: appetizer)
            }
            .onDelete { indexSet in
              order.remove(at: indexSet)
            }
          }
          .listStyle(.plain)

          Button {

          } label: {
            AppetizerButton(title: "$\(order.totalPrice) - Place Holder")
          }
          .modifier(StandardButtonStyle())
          .padding(.bottom, 40)
        }

        if order.items.isEmpty {
          OrdersEmptyState(
            imageName: "empty-order",
            message: "You have no items in your order. \nPlease add an appetizer!"
          )
        }

      }
      .navigationTitle("Order")
    }
  }
}

#Preview {
  AppetizerOrderView()
}
