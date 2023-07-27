//
//  ActivitySection.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import Foundation
import SwiftUI

struct activitySection: Identifiable {
    var id = UUID()
    var title: String
    var points: Int
    var caption: String
    var color: Color
    var image: Image
    var type: String
    var body: String
}

var activities = [
    activitySection(title: "Practicing Gratitude", points: 3, caption: "One activity that can help improve your mental health is practicing gratitude. Taking a few minutes each day to reflect on the things you are grateful for can help shift your focus to positive experiences and promote a more optimistic outlook.", color: .blue, image: Image(systemName: "heart.fill"), type: "Weekly", body: "One activity that can help improve your mental health is practicing gratitude. Taking a few minutes each day to reflect on the things you are grateful for can help shift your focus to positive experiences and promote a more optimistic outlook."),
    activitySection(title: "Mindful Breathing", points: 1, caption: "Practice mindful breathing. This simple practice can help promote relaxation, reduce stress, and improve overall well-being. Encourage yourself to practice mindful breathing whenever you feel overwhelmed or need a quick break during the day.", color: .pink, image: Image(systemName: "person"), type: "Daily", body: "Practice mindful breathing. This simple practice can help promote relaxation, reduce stress, and improve overall well-being. Encourage yourself to practice mindful breathing whenever you feel overwhelmed or need a quick break during the day.")
]
