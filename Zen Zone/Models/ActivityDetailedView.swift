//
//  ActivityDetailedView.swift
//  Zen Zone
//
//  Created by Andruw Lin on 7/13/23.
//

import Foundation
import SwiftUI

struct activitydetails: Identifiable {
    var id = UUID()
    var title: String
    var body: String
    var points: Int
    var type: String
}
var details = [
    activitydetails(title: "Practicing Gratitude", body: "One activity that can help improve your mental health is practicing gratitude. Taking a few minutes each day to reflect on the things you are grateful for can help shift your focus to positive experiences and promote a more optimistic outlook.", points: 3, type: "Weekly")
]


