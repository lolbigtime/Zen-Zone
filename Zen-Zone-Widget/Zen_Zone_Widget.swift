//
//  Zen_Zone_Widget.swift
//  Zen-Zone-Widget
//
//  Created by Andruw Lin on 10/30/23.
//

import WidgetKit
import SwiftUI
import Foundation
struct Provider: TimelineProvider {
   

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "Practicing Gratitude", type: "Weekly")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), title: "Practicing Gratitude", type: "Weekly")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 2 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, title: "Practicing Gratitude", type: "Weekly")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
    let title: String
    let type: String
}

struct Zen_Zone_WidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
            VStack (alignment: .leading, spacing: 8){
                Text(entry.title)
                    .font(.largeTitle)
                    .frame(maxWidth: 210, alignment: .leading)
                HStack{
                    Text("Activity Type: ")
                    Text(entry.type)
                }

            }
            .foregroundColor(.blue)
            .padding(30)
            .frame(width: 300, height: 240)
            .background(.linearGradient(colors: [.white, .white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .white.opacity(0.3), radius: 8, x: 0, y: 12)
            .shadow(color: .white.opacity(0.3), radius: 2, x: 0, y: 1)
        }
    
}

struct Zen_Zone_Widget: Widget {
    let kind: String = "Zen_Zone_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Zen_Zone_WidgetEntryView(entry: entry)
                .padding()
                .background(Color.clear) // Use the appropriate background color
        }
        .configurationDisplayName("Zen Zone Widget")
        .description("Add this Widget to your phone for a reminder to take some time for your own mental health!")
    }
}



#Preview(as: .systemSmall) {
    Zen_Zone_Widget()
} timeline: {
    SimpleEntry(date: .now, title: "Practicing Gratitude", type: "Weekly")
    SimpleEntry(date: .now, title: "Mindful Breathing", type: "Daily")
}
