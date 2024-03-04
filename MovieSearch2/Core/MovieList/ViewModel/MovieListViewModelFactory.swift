//
//  MovieListViewModelFactory.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Foundation

struct MovieListViewModelFactory {
  static func make() -> MovieListViewModel {
    
    let networkManager = NetworkManagerImpl()
    let movieListService = MovieListServiceImpl(networkManager: networkManager)
    return MovieListViewModel(service: movieListService)
  }
}
