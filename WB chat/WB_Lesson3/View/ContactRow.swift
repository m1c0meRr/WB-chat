//
//  ContactRow.swift
//  WB chat
//
//  Created by Sergey Savinkov on 09.06.2024.
//

import SwiftUI

struct ContactRow: View {
    
    let contact: Contact
    
    var body: some View {
        HStack(alignment: .center) {
            AvatarImageView(avatar: contact.avatar, name: contact.name, isOnline: contact.isOnline, isHistory: contact.isHistory)
                .padding(.trailing, 12)
            
            
            VStack(spacing: 2) {
                Text(contact.name)
                    .frame(width: 259,height: 24, alignment: .leading)
                
                Text(contact.isOnline ? "Online" : "Last seen \(timeManager(since: contact.lastSeen ?? Date.now))")
                //                        .textStyle(with: .metadata1)
                    .foregroundColor(.gray)
                    .frame(width: 259,height: 26, alignment: .leading)
                
            }
        }
        .contentShape(Rectangle())
        .padding(.leading, 4)
        .frame(width: 327, height: 68)
    }
    
    func timeManager(since date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}


struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: Contact.init(name: "Анастасия Иванова", initials: "АИ", isOnline: true, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: nil, isHistory: true))
            .previewLayout(.sizeThatFits)
    }
}
