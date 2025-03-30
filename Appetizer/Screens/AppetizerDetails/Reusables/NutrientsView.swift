//
//  NutrientsView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 29.03.2025.
//

import SwiftUI

struct NutrientsView: View {

  let title: String
  let value: String

  var body: some View {
    VStack(spacing: 5) {
      Text(title)
        .bold()
        .font(.caption)

      Text(value)
        .fontWeight(.semibold)
        .foregroundStyle(Color.secondary)
        .italic()
    }
  }
}

#Preview {
  NutrientsView(title: "Test", value: "90")
}
