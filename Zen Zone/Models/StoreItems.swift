//
//  StoreItems.swift
//  Zen Zone
//
//  Created by Andruw Lin on 9/11/23.
//

import Foundation
import SwiftUI

struct StoreItems: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
    var description: String
    var cost: Int
    var type: String
}

var items = [
    StoreItems(name: "Daily Streak", color: .blue, description: "Complete 3 daily activities in a single day to gain extra points", cost: 2, type: "store"),
    StoreItems(name: "Weekly Streak", color: .blue, description: "Complete 5 weekly activities from this week to gain extra points", cost: 15, type: "store")
]
