//
//  SinkCompletionHandling.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import Combine

protocol SinkCompletionHandling: Loggable {
  func handleCompletion(completion: Subscribers.Completion<Error>)
}

extension SinkCompletionHandling {
  func handleCompletion(completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      log.info("✅")
    case .failure(let error):
      log.error("🚨 ERROR: \(error.localizedDescription)")
    }
  }
}
