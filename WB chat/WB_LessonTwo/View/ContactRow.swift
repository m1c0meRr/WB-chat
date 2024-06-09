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
        HStack {
            if let avatar = contact.avatar {
                Image(avatar)
                   .resizable()
                   .scaledToFit()
                   .frame(width: 40, height: 40)
                   .clipShape(Circle())
                Circle()
                    .fill(contact.isOnline ? Color.green : Color.gray)
                    .frame(width: 10, height: 10)
            } else {
                Circle()
                   .fill(Color.gray)
                   .frame(width: 40, height: 40)
                   .overlay(
                        Text(contact.initials)
                           .font(.headline)
                           .foregroundColor(.white)
                    )
                Circle()
                    .fill(contact.isOnline ? Color.green : Color.gray)
                    .frame(width: 10, height: 10)
            }
            VStack(alignment: .leading) {
                Text(contact.name)
                   .font(.headline)
                if !contact.isOnline, let lastSeen = contact.lastSeen {
                    Text("Last seen \(timeAgo(since: lastSeen))")
                       .font(.caption)
                       .foregroundColor(.gray)
                }
            }
        }
    }
}
