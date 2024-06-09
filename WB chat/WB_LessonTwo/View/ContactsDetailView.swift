//
//  ContactsDetailView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 08.06.2024.
//

import SwiftUI

struct ContactsDetailView: View {
    let contact: Contact
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(contact.name)
                .font(.title)
            
            Text("Last seen: \(contact.lastSeen != nil ? timeAgo(since: contact.lastSeen!) : "Online")")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button("Открыть чат") {
                
            }
            .font(.system(size: 16))
            .frame(width: 327, height: 52)
            .background(Color.purple)
            .cornerRadius(30)
            .foregroundColor(.white)
            .padding(.bottom)
        }
    }
}


