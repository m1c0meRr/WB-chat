//
//  WBChatWidgetView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 24.06.2024.
//

import WidgetKit
import SwiftUI

struct WBChatWidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        GeometryReader { geo in
            VStack {
                contactImageView
            
                Text(entry.contactToDisplay[entry.currentContactIndex].name)
                    .font(.caption)
                
                Spacer()
                
                HStack {
                    changeContactButton(imageName: "chevron.left",
                                        intentIndex: (entry.currentContactIndex - 1 + entry.contactToDisplay.count) % entry.contactToDisplay.count,
                                        geo: geo
                    )
                    
                    Spacer()
                    
                    changeContactButton(imageName: "chevron.right",
                                        intentIndex: (entry.currentContactIndex + 1) % entry.contactToDisplay.count,
                                        geo: geo
                    )
                }
            }
            .widgetURL(URL(string: "myapp://contactdetails?name=\(entry.contactToDisplay[entry.currentContactIndex].name)")!)
        }
    }
}

extension WBChatWidgetView {
    @ViewBuilder
    private var contactImageView: some View {
        switch entry.contactToDisplay[entry.currentContactIndex].avatar {
        case .some(let avatar):
            Image(avatar)
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
        case nil:
            Circle()
                .frame(width: 64, height: 64)
                .foregroundStyle(.orange)
//                .overlay(
//                    Text(entry.contactToDisplay[entry.currentContactIndex].name.initials)
//                        .foregroundColor(.white)
//                        .font(.system(size: 14, weight: .bold))
//                )
        }
    }
    
    private func changeContactButton(imageName: String, intentIndex: Int, geo: GeometryProxy) -> some View {
        Button(intent: ChangeContactIntent(index: (intentIndex))) {
            Image(systemName: imageName)
                .foregroundStyle(.red)
        }
        .frame(width: geo.size.width / 2 - 4, height: 30)
        .background(
            Capsule()
                .foregroundColor(.green)
        )
        .buttonStyle(.plain)
    }
}

#Preview(as: .systemSmall) {
    WBChat_Widget()
} timeline: {
    WidgetEntry(contactToDisplay: Array(SharedData.shared.contacts), currentContactIndex: 0)
}

