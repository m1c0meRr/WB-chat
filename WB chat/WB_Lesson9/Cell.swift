//
//  Cell.swift
//  WB chat
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import SwiftUI

enum CellLayout: CaseIterable {
    case left, right, top, bottom
    
    static var randomLayout: CellLayout {
        return CellLayout.allCases.randomElement()!
    }
}

struct EmojiCell: View {
    let emoji: String
    let layout: CellLayout
    let metrics: LayoutMetrics
    
    var body: some View {
        ZStack {
            switch layout {
            case .left: left
            case .right: right
            case .top: top
            case .bottom: bottom
            }
            
            Text(emoji)
                .font(.system(size: metrics.fontSize))
                .opacity(0.5)
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .padding(metrics.padding)
    }
    
    private var left: some View {
        HStack(spacing: metrics.spacing) {
            VStack(spacing: metrics.spacing) {
                randomRectangle
                randomRectangle
            }
            randomRectangle
        }
    }
    
    private var right: some View {
        HStack(spacing: metrics.spacing) {
            VStack(spacing: metrics.spacing) {
                randomRectangle
                randomRectangle
            }
            randomRectangle
        }
    }
    
    private var bottom: some View {
        VStack(spacing: metrics.spacing) {
            HStack(spacing: metrics.spacing) {
                randomRectangle
                randomRectangle
            }
            randomRectangle
        }
    }
    
    private var top: some View {
        VStack(spacing: metrics.spacing) {
            randomRectangle
            HStack(spacing: metrics.spacing) {
                randomRectangle
                randomRectangle
            }
        }
    }
    
    private var randomRectangle: some View {
        RoundedRectangle(cornerRadius: metrics.cornerRadius)
            .stroke(style: StrokeStyle(lineWidth: metrics.strokeWidth, dash: metrics.dashPattern))
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity)
    }
}
