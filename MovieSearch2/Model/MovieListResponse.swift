//
//  MovieListResponse.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation

struct MovieListResponse: Decodable {
  let movies: [Movie]

  enum CodingKeys: String, CodingKey {
    case movies = "Search"
  }
}
