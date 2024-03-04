//
//  ImageCache.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import UIKit

protocol ImageCache {
  func get(key: String) -> UIImage?
  func set(key: String, image: UIImage)
}

class ImageCacheImpl: ImageCache {
  private init() { }
  static let shared = ImageCacheImpl()

  private let cache = NSCache<NSString, UIImage>()

  func get(key: String) -> UIImage? {
    cache.object(forKey: key as NSString)
  }
  
  func set(key: String, image: UIImage) {
    cache.setObject(image, forKey: key as NSString)
  }
}
