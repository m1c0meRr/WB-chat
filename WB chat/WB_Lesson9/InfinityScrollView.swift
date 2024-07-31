//
//  InfinityScrollView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import SwiftUI

struct InfinityScrollView: View {
    @State private var columnsNumber = 2
    private var listVariants = [1, 2, 3, 4]
    
    var body: some View {
        VStack {
            ScrollView {
                scrollStickersView
                    .id(columnsNumber)
            }.scrollIndicators(.visible)
            
            Picker("Columns Number", selection: $columnsNumber) {
                ForEach(0..<listVariants.count, id: \.self) { i in
                    Text("\(listVariants[i])").tag(i + 1)
                }
            }.pickerStyle(.segmented)
        }
        .background(Color.white)
    }
    
    private var scrollStickersView: some View {
        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: columnsNumber), spacing: LayoutMetrics(columns: columnsNumber).spacing) {
            ForEach(Array(Emoji.all.enumerated().shuffled()), id: \.offset) { index, emoji in
                EmojiCell(emoji: emoji, layout: .randomLayout, metrics: LayoutMetrics(columns: columnsNumber))
                    .aspectRatio(1, contentMode: .fit)
            }
        }
    }
}

#Preview {
    InfinityScrollView()
}
