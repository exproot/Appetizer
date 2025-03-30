//
//  ButtonStyles.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 30.03.2025.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {

  func body(content: Content) -> some View {
    content
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .tint(Color.green)
  }
}
