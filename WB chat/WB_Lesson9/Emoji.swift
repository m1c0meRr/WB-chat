//
//  Emoji.swift
//  WB chat
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import Foundation

struct Emoji {
    static var all: [String] = {
        var emojis: [String] = []
        let emojiRanges: [ClosedRange<Int>] = [
            0x1F200...0x1F2FF,
            0x1F300...0x1F5FF,
            0x1F680...0x1F6FF,
            0x1F900...0x1F9FF,
            0x1FA70...0x1FAFF
        ]
        
        for range in emojiRanges {
            for i in range {
                if let scalar = UnicodeScalar(i), scalar.properties.isEmoji {
                    emojis.append(String(scalar))
                }
            }
        }
        
        return Array(repeating: emojis, count: 100).flatMap { $0 }
    }()
}
