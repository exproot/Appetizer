//
//  AppetizerButton.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 29.03.2025.
//

import SwiftUI

struct AppetizerButton: View {

  let title: String

  var body: some View {
    Text(title)
      .font(.title3)
      .fontWeight(.semibold)
  }
}

#Preview {
  AppetizerButton(title: "Test")
}
