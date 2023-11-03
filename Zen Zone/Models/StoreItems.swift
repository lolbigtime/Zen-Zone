//
//  StoreItems.swift
//  Zen Zone
//
//  Created by Andruw Lin on 9/11/23.
//

import Foundation
import SwiftUI

struct StoreItem: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
    var description: String
    var cost: Int
    var image: String?
}

class StoreManager {
    @Published var boughtItems: [String] = []
    
    var bannerItems = [
        StoreItem(name: "Space Banner", color: .blue, description: "Customize your profile! Buy this beautiful space banner", cost: 40),
        StoreItem(name: "Sports Banner", color: .blue, description: "Customize your profile! Buy this exciting sports banner", cost: 40),
        StoreItem(name: "Flower Banner", color: .blue, description: "Express yourself! Buy this flower banner to customize your profile", cost: 40)
    ]
    
    var borderItems = [
        StoreItem(name: "Blue", color: .blue, description: "Solid blue profile image border", cost: 20),
        StoreItem(name: "Red", color: .red, description: "Solid red profile image border", cost: 20),
        StoreItem(name: "Green", color: .green, description: "Solid green profile image border", cost: 20),
        StoreItem(name: "Yellow", color: .yellow, description: "Bright yellow profile image border", cost: 20),
        StoreItem(name: "Purple", color: .purple, description: "Elegant purple profile image border", cost: 20),
        StoreItem(name: "Orange", color: .orange, description: "Vibrant orange profile image border", cost: 20),
        StoreItem(name: "Pink", color: .pink, description: "Soft pink profile image border", cost: 20),
        StoreItem(name: "Teal", color: .teal, description: "Refreshing teal profile image border", cost: 20),
        StoreItem(name: "Gray", color: .gray, description: "Subtle gray profile image border", cost: 20),
        StoreItem(name: "Cyan", color: .cyan, description: "Cyan profile image border", cost: 20),
    ]
    
    var musicItems = [
        StoreItem(name: "Beats", color: .blue, description: "Rhythmic and uplifting music", cost: 120, image: "music.quarternote.3"),
        StoreItem(name: "End", color: .red, description: "Serene and quiet music", cost: 120, image: "backward.end"),
        StoreItem(name: "Focused", color: .yellow, description: "Music for studying", cost: 120, image: "eye"),
        StoreItem(name: "Playful", color: .teal, description: "Music for fun!", cost: 120, image: "gamecontroller"),
        StoreItem(name: "Waves", color: .orange, description: "Soft and steady music", cost: 120, image: "water.waves"),

    ]
    
    init() {
        if let savedItems = UserDefaults.standard.array(forKey: "boughtitems") as? [String] {
            boughtItems = savedItems
        } else {
            UserDefaults.standard.set([], forKey: "boughtitems")
            boughtItems = []
        }
    }
    
    func boughtItem(name: String) {
        if let savedItems = UserDefaults.standard.array(forKey: "boughtitems") as? [String] {
            var itemsArray = savedItems
            itemsArray.append(name)
            UserDefaults.standard.set(itemsArray, forKey: "boughtitems")
        } else {
            var savedItemsArray: [String] = []
            savedItemsArray.append(name)
            UserDefaults.standard.set(savedItemsArray, forKey: "boughtitems")
        }
        boughtItems = UserDefaults.standard.array(forKey: "boughtitems") as! [String]
    }
    
    static let shared = StoreManager()
}
