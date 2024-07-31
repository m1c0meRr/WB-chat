//
//  WBChatWidget.swift
//  WBChatWidget
//
//  Created by Sergey Savinkov on 18.06.2024.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(contactToDisplay: WidgetData.shared.contacts, currentContactIndex: WidgetData.shared.currentContactIndex)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WidgetEntry {
        WidgetEntry(contactToDisplay: WidgetData.shared.contacts, currentContactIndex: WidgetData.shared.currentContactIndex)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WidgetEntry> {
        let timeline = Timeline(entries: [WidgetEntry(contactToDisplay: WidgetData.shared.contacts, currentContactIndex: WidgetData.shared.currentContactIndex)], policy: .atEnd)
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
    WidgetEntry(contactToDisplay: Array(WidgetData.shared.contacts), currentContactIndex: 0)
    WidgetEntry(contactToDisplay: Array(WidgetData.shared.contacts), currentContactIndex: 0)
}
