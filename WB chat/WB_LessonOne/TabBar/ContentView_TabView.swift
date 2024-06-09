//
//  ContentView_TabView.swift
//  WB Ypok1
//
//  Created by Sergey Savinkov on 04.06.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case contacts
    case chats
    case still
}

// Service
final class Router: ObservableObject {
    
    @Published var selectedTab: Tabs = .contacts
//    @Environment(\.dismiss) var dismiss
    
}

struct ContentView_TabView: View {
    
    @StateObject var router: Router = .init()
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactsView().tabItem {
                Label("Контакты", systemImage: "person.circle")
            }.tag(Tabs.contacts)
            MainScreen().tabItem {
                Label("Чаты", systemImage: "message")
            }.tag(Tabs.chats)
            ProfileScreen().tabItem {
                Label("Еще", systemImage: "ellipsis")
            }.tag(Tabs.still)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView_TabView()
}
