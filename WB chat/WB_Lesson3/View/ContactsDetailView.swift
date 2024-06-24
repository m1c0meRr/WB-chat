//
//  ContactsDetailView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 08.06.2024.
//

import SwiftUI

struct ContactsDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let contact: Contact
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            
            Text(contact.name)
                .font(.title)
            
            Text("+7 999 999-99-99")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
            
            Text("Last seen: \(contact.lastSeen != nil ? timeAgo(since: contact.lastSeen!) : "Online")")
                .font(.subheadline)
                .foregroundColor(.gray)
            HStack {
                Button {} label: {
                    Image("X")
                        .foregroundColor(.purple)
                }
                Button {} label: {
                    Image("Instagram")
                        .foregroundColor(.purple)
                }
                Button {} label: {
                    Image("LinkedIn")
                        .foregroundColor(.purple)
                }
                Button {} label: {
                    Image("Facebook")
                        .foregroundColor(.purple)
                }
            }
            .padding(15)
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .foregroundColor(.black)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }.foregroundColor(.black)
                    Text("Профиль")
                        .font(.system(size: 18))
                }
            }
            ToolbarItem(placement:.navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "pencil")
                }.foregroundColor(.black)
            }
        }
    }
}

struct ContactsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsDetailView(contact: Contact(name: "Анастасия Иванова", initials: "АИ", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: nil, isHistory: true))
    }
}
