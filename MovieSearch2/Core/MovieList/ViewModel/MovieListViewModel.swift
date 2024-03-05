//
//  MovieListViewModel.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject, SinkCompletionHandling {
  @Published var movieList = [Movie]()
  @Published var searchText: String
  private let service: MovieService
  private var currentPage = 1
  private var subs = Set<AnyCancellable>()

  init(service: MovieService, defaultSearch: String = "fire") {
    self.service = service
    self.searchText = defaultSearch
    subscribe()
  }

  private func subscribe() {
    $searchText
      .removeDuplicates()
      .debounce(for: .seconds(0.25), scheduler: RunLoop.main)
      .sink(receiveValue: handleSearchText)
      .store(in: &subs)
  }

  func loadMoreMovies(movie: Movie) {
    guard movie.id == movieList.last?.id else { return }
    currentPage += 1
    loadMovies()
  }

  private func handleSearchText(_ searchText: String) {
    currentPage = 1
    movieList.removeAll()
    loadMovies()
  }

  private func loadMovies() {
    guard searchText.count > 2 else { return }

    service.getMovieList(endpoint: .getMovieList(searchText, currentPage))
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: handleCompletion, receiveValue: handleNewMovieList)
      .store(in: &subs)
  }

  private func handleNewMovieList(_ movieList: [Movie]) {
    self.movieList += movieList
  }
}
