//
//  ContactsModel.swift
//  WB chat
//
//  Created by Sergey Savinkov on 08.06.2024.
//

import Foundation

struct Contact {
    let id = UUID()
    let name: String
    let initials: String
    let isOnline: Bool
    let lastSeen: Date?
    let avatar: String?
}

extension Contact: Hashable, Identifiable {
    
}
