//
//  DismissButton.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 29.03.2025.
//

import SwiftUI

struct DismissButton: View {
  var body: some View {
    ZStack {
      Circle()
        .frame(width: 30, height: 30)
        .foregroundStyle(Color.white)
        .opacity(0.6)

      Image(systemName: "xmark")
        .imageScale(.small)
        .frame(width: 44, height: 44)
        .foregroundStyle(Color.black)
    }
  }
}

#Preview {
  DismissButton()
}
