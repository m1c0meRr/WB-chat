//
//  SearchBar.swift
//  WB chat
//
//  Created by Sergey Savinkov on 09.06.2024.
//

import SwiftUI

public struct SearchBar: View {
    @Binding var searchText: String
    
    public init(searchText: String) {
        self.searchText = searchText
    }
    
    public var body: some View {
        TextField("Search", text: $searchText)
            .padding(40)
            .frame(height: 36)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    Spacer()
                }
                    .alignmentGuide(.leading) { $0[.leading] }
            )
    }
}
