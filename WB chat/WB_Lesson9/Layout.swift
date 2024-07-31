//
//  Layout.swift
//  WB chat
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import SwiftUI

struct LayoutMetrics {
    let columns: Int
    
    var fontSize: CGFloat {
        switch columns {
        case 1: return 270
        case 2: return 120
        case 3: return 70
        case 4: return 50
        default: return 20
        }
    }
    
    var padding: CGFloat {
        interpolatedSize(min: 10, max: 40)
    }
    
    var spacing: CGFloat {
        interpolatedSize(min: 10, max: 40)
    }
    
    var cornerRadius: CGFloat {
        interpolatedSize(min: 5, max: 20)
    }
    
    var strokeWidth: CGFloat {
        interpolatedSize(min: 4, max: 8)
    }
    
    var dashPattern: [CGFloat] {
        [
            interpolatedSize(min: 3, max: 10),
            interpolatedSize(min: 1, max: 7),
            interpolatedSize(min: 7, max: 18)
        ]
    }
    
    private func interpolatedSize(min: CGFloat, max: CGFloat) -> CGFloat {
        let maxColumns = 4
        let fraction = CGFloat(columns - 1) / CGFloat(maxColumns - 1)
        return max - fraction * (max - min)
    }
}
