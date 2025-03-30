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
        .modifier(StandardImageStyle())

//      AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//        image
//          .resizable()
//          .modifier(StandardImageStyle())
//      } placeholder: {
//        Image("food-placeholder")
//          .resizable()
//          .modifier(StandardImageStyle())
//      }

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
