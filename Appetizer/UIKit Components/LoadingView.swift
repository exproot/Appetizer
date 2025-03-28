//
//  LoadingView.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

  func makeUIView(context: Context) -> UIActivityIndicatorView {
    let activityIndicatorView = UIActivityIndicatorView(style: .large)

    activityIndicatorView.tintColor = .accent
    activityIndicatorView.startAnimating()
    return activityIndicatorView
  }

  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView: View {
  var body: some View {
    ZStack {
      Color(.systemBackground)
        .ignoresSafeArea()

      ActivityIndicator()
    }
  }
}
