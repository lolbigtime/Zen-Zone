//
//  EntryItem.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/13/23.
//

import Foundation
import SwiftUI
import UIKit

struct EntryItem: Identifiable, Codable {
    var id = UUID()
    var mood: String
    var activities: [String]
    var feelings: [String]
    var title: String
    var notes: String
    var type: String
    var date: DateComponents
    
    var imageData: Data?  // Changed the property type to Data?
        
    // Computed property to convert between UIImage and Data
    var image: UIImage? {
        get {
            if let imageData = imageData {
                return UIImage(data: imageData)
            } else {
                return nil
            }
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
    
}
struct EntrySection: Identifiable, Codable {
    var id: String {
        return "\(date)"
    }
    
    var date: DateComponents
    var items: [EntryItem]
    
    var mood: Int
    var photos: Int
    var journal: Int
    
    init(date: DateComponents, items: [EntryItem], mood: Int, photos: Int, journal: Int) {
        self.date = date
        self.items = items
        self.mood = mood
        self.photos = photos
        self.journal = journal

    }
}

class SavedEntries: ObservableObject {
    @Published var entrySections: [EntrySection] = []
    
    private let userDefaultsKey = "SavedEntries"
    
    init() {
        loadEntrySections()
    }
    
    func saveEntrySections() {
        do {
            let data = try JSONEncoder().encode(entrySections)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Failed to encode and save entry sections: \(error.localizedDescription)")
        }
    }
    
    func loadEntrySections() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            return
        }
        
        do {
            let decodedSections = try JSONDecoder().decode([EntrySection].self, from: data)
            entrySections = decodedSections
        } catch {
            print("Failed to decode and load entry sections: \(error.localizedDescription)")
        }
    }
}
