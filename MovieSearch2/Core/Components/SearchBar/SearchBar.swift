//
//  SearchBar.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import SwiftUI

struct SearchBar: View {

  @Binding private(set) var searchText: String
  @FocusState private var isFocused: Bool

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      TextField("Search..", text: $searchText)
        .disableAutocorrection(true)
        .focused($isFocused)
        .overlay(alignment: .trailing) {
          Image(systemName: "xmark.circle.fill")
            .padding()
            .offset(x: 15)
            .opacity(searchText == "" ? 0 : 1)
            .onTapGesture {
              searchText.removeAll()
              isFocused = true
            }
        }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 21)
        .fill(Color.gray)
        .shadow(
          color: .secondary.opacity(0.6),
          radius: 10
        )
    )
    .padding()
  }
}

#Preview {
  SearchBar(searchText: .constant(""))
}

