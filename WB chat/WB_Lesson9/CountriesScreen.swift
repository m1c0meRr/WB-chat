//
//  Countries.swift
//  WB chat
//
//  Created by Sergey Savinkov on 27.06.2024.
//

import SwiftUI

struct Flag: Identifiable {
    
    let emoji: String
    let name: String
    let id: String = UUID().uuidString
    
    static let oceania = [Flag(emoji: "1🇰🇿", name: "1"),
                          Flag(emoji: "2🇮🇨", name: "2"),
                          Flag(emoji: "3🇶🇦", name: "3"),
                          Flag(emoji: "4🇨🇳", name: "4"),
                          Flag(emoji: "5🇱🇦", name: "5"),
    ]
    
}

struct CountriesScreen: View {
    
    @State var flags: [Flag] = Flag.oceania
    
    var body: some View {
        List{
            ForEach(flags) { flag in
                HStack{
                    Text(flag.emoji)
                    Text(flag.name)
                }
            }
            .onMove { flags.move(fromOffsets: $0, toOffset: $1)}
            .onDelete { flags.remove(atOffsets: $0)}
        }
    }
}

#Preview {
    CountriesScreen()
}
