//
//  Endpoint.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation

protocol Endpoint {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var queryParams: [String: String]? { get }
  var url: URL? { get }
}

enum MovieListAPI {
  case getMovieList(String, Int)
}

extension MovieListAPI: Endpoint {
  var scheme: String {
    switch self {
    case .getMovieList(_, _):
      return "https"
    }
  }
  
  var host: String {
    switch self {
    case .getMovieList(_, _):
      return "omdbapi.com"
    }
  }
  
  var path: String {
    switch self {
    case .getMovieList(_, _):
      return ""
    }
  }
  
  var queryParams: [String : String]? {
    switch self {
    case .getMovieList(let searchText, let page):
      return [
        "s": searchText,
        "page": "\(page)",
        "apikey": "549ab0f2"
      ]
    }
  }
  
  var url: URL? {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    components.queryItems = queryParams?.map { .init(name: $0, value: $1) }
    return components.url
  }
}
