//
//  Movie.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation

struct Movie: Decodable, Identifiable {
  let id: String
  let title: String
  let year: String
  let imageUrl: String

  enum CodingKeys: String, CodingKey {
    case id = "imdbID"
    case title = "Title"
    case year = "Year"
    case imageUrl = "Poster"
  }
}

extension Movie {
  static var MOCK_MOVIE: Movie {
    .init(
      id: "342",
      title: "Batman: The Killing Joke",
      year: "2016",
      imageUrl: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
    )
  }
}
