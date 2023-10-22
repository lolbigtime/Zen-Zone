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
    var description: String
    var cost: Int
    var type: String
}

var items = [
    StoreItems(name: "Daily Streak", description: "Complete 3 daily activities in a single day to gain extra points", cost: 2, type: "streak"),
    StoreItems(name: "Weekly Streak", description: "Complete 5 weekly activities from this week to gain extra points", cost: 15, type: "streak"),
    StoreItems(name: "Green", description: "New Background Color!", cost: 50, type: "cosmetic"),
    StoreItems(name: "Yellow", description: "New Background Color!", cost: 50, type: "cosmetic")
]
class InventoryModel: ObservableObject {
    @Published var inventory: [StoreItems] = []

    func addItemToInventory(_ item: StoreItems) {
        inventory.append(item)
    }
}



