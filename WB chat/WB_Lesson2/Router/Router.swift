//
//  Router.swift
//  WB chat
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import Foundation
import SwiftUI

enum Tabs: Hashable {
    case contacts
    case chats
    case still
}

final class Router: ObservableObject {
    
    @Published var selectedTab: Tabs = .contacts
    //    @Environment(\.dismiss) var dismiss
    
    static let shared: Router = .init()
    
    private init() {}
    
    func moveToTab(tab: Tabs) {
        selectedTab = tab
    }
}

