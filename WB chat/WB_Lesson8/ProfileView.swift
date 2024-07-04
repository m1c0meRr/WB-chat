//
//  ProfileView.swift
//  WBLesson_8
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var profile = Profile()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text(profile.seasonalPhoto.rawValue)
                    .font(.system(size: 150))
                Text(profile.username)
                    .font(.system(size: 30))
                    .bold()
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                HStack {
                    Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                }
                Spacer()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: {
                                DetailViewController(profile: $profile, username: $profile.username, prefersNotifications: $profile.prefersNotifications, seasonalPhoto: $profile.seasonalPhoto, goalDate: $profile.goalDate)
                            }, label: {
                                Image(systemName: "pencil")
                            })
                        }
                    }
            }
            .navigationBarTitle("Profile")
            .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
