//
//  ContactsView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 08.06.2024.
//

import SwiftUI
import UISystem

struct ContactsView: View {
    
    @State private var contacts: [Contact] = [
        Contact(name: "Анастасия Иванова", initials: "АИ", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: "nastya", isHistory: true),
        Contact(name: "Петя", initials: "П", isOnline: true, lastSeen: nil, avatar: "petya", isHistory: false),
        Contact(name: "Маман", initials: "М", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -10800), avatar: "maman", isHistory: true),
        Contact(name: "Арбуз Дыня", initials: "АД", isOnline: true, lastSeen: nil, avatar: "arbuz", isHistory: false),
        Contact(name: "Иван Иванов", initials: "ИИ", isOnline: true, lastSeen: nil, avatar: nil, isHistory: false),
        Contact(name: "Лиса Алиса", initials: "ЛА", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -1800), avatar: "test", isHistory: true)
    ]
    
    @State private var searchText = ""
    @State private var selectedContact: Contact? = nil
    @State private var navigateToDetail: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding()
                List(filteredContacts) { contact in
                    ContactRow(contact: contact)
                        .onTapGesture {
                            selectedContact = contact
                            navigateToDetail.toggle()
                        }
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement:.navigationBarLeading) {
                        Text("Контакты")
                            .font(.title)
                    }
                    ToolbarItem(placement:.navigationBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .navigationDestination(isPresented: $navigateToDetail) {
                    if let contact = selectedContact {
                        ContactsDetailView(contact: contact)
                    }
                }
            }
        }
    }
    
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                contact.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}

func timeAgo(since date: Date) -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.dateTimeStyle = .named
    return formatter.localizedString(for: date, relativeTo: Date())
}

#Preview {
    ContactsView()
}
