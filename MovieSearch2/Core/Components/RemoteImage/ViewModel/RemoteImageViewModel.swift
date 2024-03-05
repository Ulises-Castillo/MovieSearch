//
//  RemoteImageViewModel.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import UIKit
import Combine

class RemoteImageViewModel: ObservableObject, SinkCompletionHandling {
  @Published var image: UIImage?
  @Published var isLoading = false
  private let service: ImageService
  private var sub: AnyCancellable?

  init(service: ImageService) {
    self.service = service
    loadImage()
  }

  private func loadImage() {
    isLoading = true
    sub = service.getImage()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: complete, receiveValue: handleImage)
  }

  private func complete(completion: Subscribers.Completion<Error>) {
    isLoading = false
    handleCompletion(completion: completion)
  }

  private func handleImage(image: UIImage?) {
    self.image = image
  }
}
