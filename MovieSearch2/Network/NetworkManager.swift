//
//  NetworkManager.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation
import Combine

protocol Downloader {
  func download(url: URL?) -> AnyPublisher<Data, Error>
}

protocol NetworkManager: Downloader {
  func getAndDecodeObjects<Model: Decodable>(endPoint: Endpoint) -> AnyPublisher<Model, Error>
}

struct NetworkManagerImpl: NetworkManager {
  func getAndDecodeObjects<Model>(endPoint: Endpoint) -> AnyPublisher<Model, Error> where Model : Decodable {
    return download(url: endPoint.url)
      .decode(type: Model.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }

  func download(url: URL?) -> AnyPublisher<Data, Error> {
    guard let url = url else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: url)
      .retry(3)
      .tryMap{ $0.data }
      .eraseToAnyPublisher()
  }
}
