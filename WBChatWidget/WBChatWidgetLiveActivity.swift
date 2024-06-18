//
//  WBChatWidgetLiveActivity.swift
//  WBChatWidget
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WBChatWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WBChatWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WBChatWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WBChatWidgetAttributes {
    fileprivate static var preview: WBChatWidgetAttributes {
        WBChatWidgetAttributes(name: "World")
    }
}

extension WBChatWidgetAttributes.ContentState {
    fileprivate static var smiley: WBChatWidgetAttributes.ContentState {
        WBChatWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WBChatWidgetAttributes.ContentState {
         WBChatWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WBChatWidgetAttributes.preview) {
   WBChatWidgetLiveActivity()
} contentStates: {
    WBChatWidgetAttributes.ContentState.smiley
    WBChatWidgetAttributes.ContentState.starEyes
}
