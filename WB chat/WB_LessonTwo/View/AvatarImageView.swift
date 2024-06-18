//
//  AvatarView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import SwiftUI

struct AvatarView: View {
    var avatar: String?
    var name: String
    var isOnline: Bool
    var hasHistory: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            if avatar != nil {
                Image(avatar ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .cornerRadius(16)
                    .padding(8)
            } else  {
                ZStack {
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 48, height: 48)
                        .cornerRadius(16)
                    
                    Text(initials(name: name))
                        .foregroundColor(.white)
                }
            }
            
            if hasHistory {
                RoundedRectangle(cornerRadius: 18)
                    .stroke(LinearGradient(colors: [.purple, .purple], startPoint:.topLeading , endPoint: .bottomTrailing), lineWidth: 2)
                    .frame(width: 56, height: 56)
            }
            
            if isOnline {
                Circle()
                    .fill(Color.green)
                    .frame(width: 12, height: 12)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: 20, y: -23)
            }
            
            
        }
    }
    
    func initials(name: String) -> String {
        let words = name.split(separator: " ")
        guard words.count > 0 else {
            return ""
        }
        let firstNameInitial = words.first?.first?.uppercased() ?? ""
        let lastNameInitial = words.dropFirst().first?.first?.uppercased() ?? ""
        if words.count == 1 {
            return firstNameInitial
        }
        return firstNameInitial + lastNameInitial
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(avatar: nil, name: "Oleg Oleg", isOnline: true, hasHistory: true)
            .previewLayout(.sizeThatFits)
    }
}
