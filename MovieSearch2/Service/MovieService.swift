//
//  MovieListService.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation
import Combine

protocol MovieService {
  func getMovieList(endpoint: MovieListAPI) -> AnyPublisher<[Movie], Error>
}

struct MovieServiceImpl: MovieService {

  private let networkManager: NetworkManager

  init(networkManager: NetworkManager) {
    self.networkManager = networkManager
  }

  func getMovieList(endpoint: MovieListAPI) -> AnyPublisher<[Movie], Error> {
    networkManager.getAndDecodeObjects(endPoint: endpoint)
      .map { $0 as MovieListResponse }
      .map { $0.movies }
      .eraseToAnyPublisher()
  }
}
