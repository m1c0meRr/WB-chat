//
//  ContactsView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 08.06.2024.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var contacts: [Contact] = [
        Contact(name: "Анастасия Иванова", initials: "АИ", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: nil),
        Contact(name: "Петя", initials: "П", isOnline: true, lastSeen: nil, avatar: nil),
        Contact(name: "Маман", initials: "М", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -10800), avatar: "onboardingImage"),
        Contact(name: "Арбуз Дыня", initials: "АД", isOnline: true, lastSeen: nil, avatar: nil),
        Contact(name: "Иван Иванов", initials: "ИИ", isOnline: true, lastSeen: nil, avatar: nil),
        Contact(name: "Лиса Алиса", initials: "ЛА", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -1800), avatar: "test")
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding()

                List {
                    ForEach(filteredContacts) { contact in
                        NavigationLink(destination: ContactsDetailView(contact: contact)) {
                            ContactRow(contact: contact)
                        }
                    }
                    .onDelete(perform: deleteContact)
                }
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
