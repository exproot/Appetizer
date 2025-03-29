//
//  OrdersEmptyState.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 29.03.2025.
//

import SwiftUI

struct OrdersEmptyState: View {

  let imageName: String
  let message: String

  var body: some View {
    ZStack {
      Color(.systemBackground)
        .ignoresSafeArea()

      VStack {
        Image(imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(height: 150)

        Text(message)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
          .foregroundStyle(Color.secondary)
          .padding()
      }
      .offset(y: -40)
    }
  }
}

#Preview {
  OrdersEmptyState(imageName: "empty-order", message: "This is a test message.\nMaking this a little long for testing.")
}
