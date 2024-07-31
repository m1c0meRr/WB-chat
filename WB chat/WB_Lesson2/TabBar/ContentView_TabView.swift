//
//  ContentView_TabView.swift
//  WB Ypok1
//
//  Created by Sergey Savinkov on 04.06.2024.
//

import SwiftUI

struct ContentView_TabView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().backgroundImage = UIImage()
    }
    
    @StateObject var router: Router = Router.shared
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactsView().tabItem {
                Image(systemName: "person.2")
            }
            .tag(Tabs.contacts)
            MainScreen().tabItem {
                Image(systemName: "message")
            }.tag(Tabs.chats)
            ProfileScreen().tabItem {
                Image(systemName: "ellipsis")
            }
            .tag(Tabs.still)
        }
        .accentColor(.purple)
        .foregroundColor(.black)
    }
}

#Preview {
    ContentView_TabView()
}
