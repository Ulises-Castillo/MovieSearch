//
//  ContentView.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import SwiftUI

struct MovieListView: View {

  @StateObject var vm = MovieListViewModelFactory.make()

  var body: some View {
    NavigationView {
      VStack {
        // search bar
        SearchBar(searchText: $vm.searchText)
        // list
        List {
          ForEach(vm.movieList) { movie in
            NavigationLink {
              MovieDetailView(movie: movie)
            } label: {
              MovieListCell(movie: movie)
                .onAppear { vm.loadMoreMovies(movie: movie) }
            }
          }
        }
        .listStyle(.plain)
      }
      .navigationTitle("Movies")
    }
  }
}

#Preview {
  MovieListView()
}
