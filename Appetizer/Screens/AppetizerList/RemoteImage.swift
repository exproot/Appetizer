//
//  RemoteImage.swift
//  Appetizer
//
//  Created by Ertan Yağmur on 28.03.2025.
//

import SwiftUI

final class ImageLoader: ObservableObject {

  @Published var image: Image? = nil

  func load(from urlString: String) {
    NetworkManager.shared.downloadImage(from: urlString) { [weak self] uikitImage in
      guard let uikitImage = uikitImage else { return }

      DispatchQueue.main.async {
        self?.image = Image(uiImage: uikitImage)
      }
    }
  }
}

struct RemoteImage: View {

  var image: Image?

  var body: some View {
    image?.resizable() ?? Image("food-placeholder").resizable()
  }
}

struct AppetizerRemoteImageView: View {

  @StateObject var imageLoader = ImageLoader()
  let urlString: String

  var body: some View {
    RemoteImage(image: imageLoader.image)
      .onAppear {
        imageLoader.load(from: urlString)
      }
  }
}
