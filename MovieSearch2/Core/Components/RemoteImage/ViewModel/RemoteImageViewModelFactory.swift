//
//  RemoteImageViewModelFactory.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation

struct RemoteImageViewModelFactory {
  static func make(url: String) -> RemoteImageViewModel {

    let cache = ImageCacheImpl.shared
    let networkManager = NetworkManagerImpl()
    let imageService = ImageServiceImpl(url: url, networkManager: networkManager, cache: cache)
    return RemoteImageViewModel(service: imageService)
  }

}
