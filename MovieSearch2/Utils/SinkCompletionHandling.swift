//
//  SinkCompletionHandling.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Combine

protocol SinkCompletionHandling {
  func handleCompletion(completion: Subscribers.Completion<Error>)
}

extension SinkCompletionHandling {
  func handleCompletion(completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      debugPrint("✅")
    case .failure(let error):
      debugPrint("🚨 ERROR: \(error.localizedDescription)")
    }
  }
}
