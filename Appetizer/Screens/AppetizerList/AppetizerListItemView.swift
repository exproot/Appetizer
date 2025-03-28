//
//  AppetizerListItemView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerListItemView: View {

  let appetizer: Appetizer

  var body: some View {
    HStack {
      AppetizerRemoteImageView(urlString: appetizer.imageURL)
        .aspectRatio(contentMode: .fit)
        .clipShape(.rect(cornerRadius: 10))
        .frame(width: 120, height: 90)

      VStack(alignment: .leading, spacing: 5) {
        Text(appetizer.name)
          .font(.title2)
          .fontWeight(.medium)

        Text("$\(appetizer.price, specifier: "%.2f")")
          .font(.body)
          .fontWeight(.semibold)
          .foregroundStyle(Color.secondary)
      }
      .padding(.leading)
    }
  }
}

#Preview {
  AppetizerListItemView(appetizer: MockData.sampleAppetizer)
}
