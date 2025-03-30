//
//  ImageStyles.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 30.03.2025.
//

import SwiftUI

struct StandardImageStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .aspectRatio(contentMode: .fit)
      .clipShape(.rect(cornerRadius: 10))
      .frame(width: 120, height: 90)
  }
}
