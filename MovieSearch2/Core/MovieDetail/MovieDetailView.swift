//
//  MovieDetailView.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import SwiftUI

struct MovieDetailView: View {

  let movie: Movie

  var body: some View {

    ZStack {
      RemoteImage(url: movie.imageUrl)
        .scaledToFit()
        .frame(width: UIScreen.main.bounds.width)
      VStack {
        Text(movie.title)
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.horizontal)
          .lineLimit(2)
          .minimumScaleFactor(0.5)
          .offset(y: -33)
        Spacer()
        Text(movie.year)
          .font(.title)
          .fontWeight(.heavy)
      }
    }
  }
}

#Preview {
  MovieDetailView(movie: Movie.MOCK_MOVIE)
}
