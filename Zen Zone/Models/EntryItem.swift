//
//  EntryItem.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/13/23.
//

import Foundation
import SwiftUI

struct EntryItem: Identifiable {
    var id = UUID()
    var mood: String
    var activities: [String]
    var feelings: [String]
    var title: String
    var notes: String
    var photo: Image?
    var type: String
    var date: DateComponents
}
struct EntrySection: Identifiable {
    var id = UUID()
    var date: DateComponents
    var items: [EntryItem]
}
var jEntries = [
    EntrySection(date: Calendar.current.dateComponents([.year, .month, .weekday, .day], from: Date.now), items: [EntryItem(mood: "Great!", activities: ["Coding"], feelings: ["Tired"], title: "Coding baby!!!", notes: "Need to do USACO", photo: nil, type: "text", date: Calendar.current.dateComponents([.year, .month, .weekday, .day], from: Date.now)), EntryItem(mood: "Great!", activities: ["Coding"], feelings: ["Tired"], title: "SLEEEEP baby!!!", notes: "Need to do USACO", photo: nil, type: "text", date: Calendar.current.dateComponents([.year, .month, .weekday, .day], from: Date.now))])
]


