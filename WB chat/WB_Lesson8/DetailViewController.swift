//
//  DetailViewController.swift
//  WBLesson_8
//
//  Created by Sergey Savinkov on 04.07.2024.
//

import SwiftUI

struct DetailViewController: View {
    @Environment(\.dismiss) var dissmis
    @Binding var profile: Profile
    @Binding var username: String
    @Binding var prefersNotifications: Bool
    @Binding var seasonalPhoto: Profile.Season
    @Binding var goalDate: Date
    
    var body: some View {
        NavigationStack {
            Text(seasonalPhoto.rawValue)
                .font(.system(size: 150))
            VStack(alignment: .center, spacing: 15) {
                Picker("User image", selection: $seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TextField("Username", text: $username)
                    .font(.system(size: 40))
                    .bold()
                HStack {
                    Text("Notifications")
                    Toggle("", isOn: $prefersNotifications)
                        .frame(width: 50)
                }
                
                DatePicker("Set the date", selection: $goalDate)
                
                Button(action: {
                    profile.getNewProfile(username, prefersNotifications, seasonalPhoto, goalDate)
                    dissmis()
                }) {
                    Text("Save")
                }
            }
            .frame(width: 350, height: 80)
            .multilineTextAlignment(.center)
        }
        .navigationBarBackButtonHidden()
    }
}
