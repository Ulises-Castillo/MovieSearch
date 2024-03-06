//
//  RemoteImage.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import SwiftUI

struct RemoteImage: View {

  @StateObject private var vm: RemoteImageViewModel

  init(url: String) {
    _vm = StateObject(wrappedValue: RemoteImageViewModelFactory.make(url: url))
  }

  var body: some View {
    if let image = vm.image {
      Image(uiImage: image)
        .resizable()
    } else if vm.isLoading {
      ProgressView()
    } else {
      Color.gray
    }
  }
}

#Preview {
  RemoteImage(url: Movie.MOCK_MOVIE.imageUrl)
}
