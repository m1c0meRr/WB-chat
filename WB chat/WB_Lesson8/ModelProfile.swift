//
//  model.swift
//  WBLesson_8
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import Foundation

struct Profile {
    var username: String = "Username"
    var prefersNotifications = true
    var seasonalPhoto = Season.summer
    var goalDate = Date()
    
    enum Season: String, CaseIterable, Identifiable {
        case winter = "❄️"
        case spring = "🌼"
        case summer = "🌞"
        case autumn = "🍁"
        
        var id: String { rawValue }
    }
}

extension Profile {
    mutating func getNewProfile(_ username: String, _ prefersNotifications: Bool, _ seasonalPhoto: Profile.Season, _ goalDate: Date ) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = goalDate
    }
}
