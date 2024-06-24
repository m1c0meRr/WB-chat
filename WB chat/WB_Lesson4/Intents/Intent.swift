//
//  Intent.swift
//  WB chat
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import Foundation
import AppIntents

final class chatIntent: AppIntent {
    
    static var title: LocalizedStringResource = "open chats"
    
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.moveToTab(tab: .still)
        return .result()
    }
}
