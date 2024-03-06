//
//  MovieListCell.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import SwiftUI

struct MovieListCell: View {
  let movie: Movie

  var body: some View {
    HStack {
      RemoteImage(url: movie.imageUrl)
        .scaledToFill()                 // CRUCIAL: scale to fill FIRST
        .frame(width: 100, height: 100) // THEN, set frame
        .cornerRadius(12)               // aspect ratio unchanged
      VStack(alignment: .leading) {
        Text(movie.title)
          .font(.title3)
          .fontWeight(.bold)
        Text(movie.year)
          .font(.headline)
          .fontWeight(.bold)
          .foregroundColor(.secondary)
      }
      .padding(.horizontal)
    }
  }
}

#Preview {
  MovieListCell(movie: Movie.MOCK_MOVIE)
}
