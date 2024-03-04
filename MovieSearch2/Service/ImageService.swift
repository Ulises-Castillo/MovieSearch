//
//  ImageService.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import UIKit
import Combine

protocol ImageService {
  func getImage() -> AnyPublisher<UIImage?, Error>
}

class ImageServiceImpl: ImageService, SinkCompletionHandling {

  private let url: String
  private let networkManager: Downloader
  private let cache: ImageCache
  private var sub: AnyCancellable?

  init(url: String, networkManager: Downloader, cache: ImageCache) {
    self.url = url
    self.networkManager = networkManager
    self.cache = cache
  }

  func getImage() -> AnyPublisher<UIImage?, Error> {
    if let cachedImage = cache.get(key: url) {
      debugPrint("CACHE HIT")

      return Just(cachedImage)
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }

    let pub = networkManager.download(url: URL(string: url))
      .tryMap { UIImage(data: $0) }
      .share()

    sub = pub
      .sink(receiveCompletion: handleCompletion, receiveValue: handleImage)

    return pub
      .eraseToAnyPublisher()
  }

  private func handleImage(image: UIImage?) {
    guard let image else { return }
    cache.set(key: url, image: image)
  }
}
