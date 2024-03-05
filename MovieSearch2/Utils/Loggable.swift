//
//  Log.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import OSLog

protocol Loggable {
  var log: Logger { get }
}

extension Loggable {
  var log: Logger {
    Logger(subsystem: Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "N/A",
           category: String(describing: self))
  }
}
