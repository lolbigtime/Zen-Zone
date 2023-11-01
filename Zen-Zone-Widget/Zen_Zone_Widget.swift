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
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct Zen_Zone_WidgetEntryView : View {
    var activity: activitySection
    var entry: Provider.Entry
    var body: some View {
            VStack (alignment: .leading, spacing: 8){
                Text(activity.title)
                    .font(.largeTitle)
                    .frame(maxWidth: 210, alignment: .leading)
                HStack{
                    Text("Activity Type: ")
                    Text(activity.type)
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
            Zen_Zone_WidgetEntryView(activity: activities[0], entry: entry)
                .padding()
                .background(Color.clear) // Use the appropriate background color
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
struct activitySection: Identifiable {
    var id = UUID()
    var title: String
    var points: Int
    var caption: String
    var type: String

}

var activities = [
    activitySection(title: "Practicing Gratitude", points: 3, caption: "One activity that can help improve your mental health is practicing gratitude. Taking a few minutes each day to reflect on the things you are grateful for can help shift your focus to positive experiences and promote a more optimistic outlook.", type: "Weekly"),
    activitySection(title: "Practicing Gratitude", points: 3, caption: "One activity that can help improve your mental health is practicing gratitude. Taking a few minutes each day to reflect on the things you are grateful for can help shift your focus to positive experiences and promote a more optimistic outlook.", type: "Weekly"),
    activitySection(title: "Mindful Breathing", points: 1, caption: "Practice mindful breathing. This simple practice can help promote relaxation, reduce stress, and improve overall well-being. Encourage yourself to practice mindful breathing whenever you feel overwhelmed or need a quick break during the day.", type: "Daily")
]


#Preview(as: .systemSmall) {
    Zen_Zone_Widget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
