//
//  AppetizerDetailsView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct AppetizerDetailsView: View {

  let appetizer: Appetizer
  @Binding var isShowingDetail: Bool

  var body: some View {
    VStack {
      AppetizerRemoteImageView(urlString: appetizer.imageURL)
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 300, maxHeight: 225)

      VStack {
        Text(appetizer.name)
          .font(.title2)
          .fontWeight(.semibold)

        Text(appetizer.description)
          .multilineTextAlignment(.center)
          .font(.body)
          .padding()

        HStack(spacing: 40) {
          NutrientsView(title: "Calories", value: "\(appetizer.calories)")
          NutrientsView(title: "Carbs", value: "\(appetizer.carbs) g")
          NutrientsView(title: "Protein", value: "\(appetizer.protein) g")
        }
      }

      Spacer()

      Button {

      } label: {
        AppetizerButton(title: "$\(appetizer.price) - Add To Order")
      }
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .tint(.green)
      .padding()
    }
    .frame(width: 300, height: 525)
    .background(Color(.systemBackground))
    .clipShape(.rect(cornerRadius: 12))
    .shadow(radius: 40)
    .overlay(alignment: .topTrailing) {
      Button {
        isShowingDetail = false
      } label: {
        DismissButton()
      }
    }
  }
}

#Preview {
  AppetizerDetailsView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
