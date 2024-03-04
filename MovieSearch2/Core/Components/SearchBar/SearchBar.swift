//
//  SearchBar.swift
//  MovieSearch2
//
//  Created by Ulises Castillo on 3/4/24.
//

import SwiftUI

struct SearchBar: View {

  @Binding var searchText: String
  @FocusState private var isFocused: Bool

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      TextField("Search..", text: $searchText)
        .focused($isFocused)
        .overlay(
          Image(systemName: "xmark.circle.fill")
            .padding()
            .offset(x: 15)
            .opacity(searchText == "" ? 0 : 1)
            .onTapGesture {
              searchText.removeAll()
              isFocused = false
            }
          ,alignment: .trailing
        )

    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 21)
        .foregroundColor(.gray)
    )
    .padding()
  }
}

#Preview {
  SearchBar(searchText: .constant(""))
}
