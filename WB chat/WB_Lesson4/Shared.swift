//
//  Shared.swift
//  WB chat
//
//  Created by Sergey Savinkov on 24.06.2024.
//

import Foundation

class WidgetData {
    static let shared = WidgetData()
    
    var currentContactIndex: Int = 0
    
    var contacts: [Contact] = [
        Contact(name: "Анастасия Иванова", initials: "АИ", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: "nastya", isHistory: true),
        Contact(name: "Петя", initials: "П", isOnline: true, lastSeen: nil, avatar: "petya", isHistory: false),
        Contact(name: "Маман", initials: "М", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -10800), avatar: "maman", isHistory: true),
        Contact(name: "Арбуз Дыня", initials: "АД", isOnline: true, lastSeen: nil, avatar: "arbuz", isHistory: false),
        Contact(name: "Иван Иванов", initials: "ИИ", isOnline: true, lastSeen: nil, avatar: nil, isHistory: false),
        Contact(name: "Лиса Алиса", initials: "ЛА", isOnline: false, lastSeen: Date(timeIntervalSinceNow: -1800), avatar: "test", isHistory: true)
    ]
}
