//
//  MatchScreen.swift
//  WB Ypok1
//
//  Created by Sergey Savinkov on 04.06.2024.
//

import SwiftUI

enum Team: CaseIterable {
    case one, two
}

struct Match {
    
    var score: [Int] = [0,0]
    var who: Team?
    var isOver: Bool = false
    
    mutating func incrementScore(team: Team) {
        switch team {
        case .one: score[0] += 1
        case .two: score[1] += 1
        }
        who = score[0] == score[1] ? nil : (score[0] > score[1] ? .one : .two)
        isOver = score.contains(10)
    }
}

struct MatchScreen: View {
    
    @State var match: Match = .init()
    
    var body: some View {
        VStack {
            HStack {
                playerCell(title: "Me", who: .one)
                playerCell(title: "You", who: .two)
            }
        }
    }
    
    func playerCell(title: String, who: Team) -> some View {
        VStack {
            Text(title).font(.title)
            Image(systemName: "circle.fill").foregroundColor(match.who == who ? .red : .clear)
            Button { match.incrementScore(team: who)}
            label: {
                Image(systemName: "\(match.score[who == .one ? 0 : 1]).circle.fill").font(.system(size: 100))
            }
        }.alert(isPresented: $match.isOver) {
            Alert(title: Text("Finish"),
                  message: Text("winner is player \(match.who == .one ? "one" : "two")"),
                  dismissButton: .default(Text("Reset")) { match = .init()})
        }
    }
}

#Preview {
    MatchScreen()
}
