//
//  WBChatWidget.swift
//  WBChatWidget
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import WidgetKit
import SwiftUI
import AppIntents

//struct Provider: AppIntentTimelineProvider {
//    typealias Entry = SimpleEntry
//    var imageArray = [""]
//    
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
//    }
//    
//    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: configuration)
//    }
//    
//    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
//        var entries: [SimpleEntry] = []
//        
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//        
//        return Timeline(entries: entries, policy: .atEnd)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationAppIntent
//}
//
//struct WBChatWidget: Widget {
//    let kind: String = "WBChatWidget"
//    
//    var body: some WidgetConfiguration {
//        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
//            WBChatWidgetEntryView(entry: entry)
//                .containerBackground(.fill.tertiary, for: .widget)
//        }
//    }
//}
//
//extension ConfigurationAppIntent {
//    fileprivate static var smiley: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "😀"
//        return intent
//    }
//    
//    fileprivate static var starEyes: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
//        return intent
//    }
//}
//
//#Preview(as: .systemSmall) {
//    WBChatWidget()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .smiley)
//    SimpleEntry(date: .now, configuration: .starEyes)
//}

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(contactToDisplay: SharedData.shared.contacts, currentContactIndex: SharedData.shared.currentContactIndex)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WidgetEntry {
        WidgetEntry(contactToDisplay: SharedData.shared.contacts, currentContactIndex: SharedData.shared.currentContactIndex)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WidgetEntry> {
        let timeline = Timeline(entries: [WidgetEntry(contactToDisplay: SharedData.shared.contacts, currentContactIndex: SharedData.shared.currentContactIndex)], policy: .atEnd)
        return timeline
    }
}

struct WidgetEntry: TimelineEntry {
    var date: Date = .now
    var contactToDisplay: [Contact]
    var currentContactIndex: Int
}

struct WBChat_WidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry

    var body: some View {
        switch family {
        case .systemSmall:
            WBChatWidgetView(entry: entry)
        case .systemMedium:
            WBChatWidgetView(entry: entry)
        case .systemLarge:
            WBChatWidgetView(entry: entry)
        case .systemExtraLarge:
            WBChatWidgetView(entry: entry)
        case .accessoryCircular:
            WBChatWidgetView(entry: entry)
        case .accessoryRectangular:
            WBChatWidgetView(entry: entry)
        case .accessoryInline:
            WBChatWidgetView(entry: entry)
        @unknown default:
            WBChatWidgetView(entry: entry)
        }
    }
}

struct WBChat_Widget: Widget {
    @Environment(\.widgetFamily) var family
    let kind: String = "WBChat_Widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBChat_WidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemExtraLarge) {
    WBChat_Widget()
} timeline: {
    WidgetEntry(contactToDisplay: Array(SharedData.shared.contacts), currentContactIndex: 0)
    WidgetEntry(contactToDisplay: Array(SharedData.shared.contacts), currentContactIndex: 0)
}
