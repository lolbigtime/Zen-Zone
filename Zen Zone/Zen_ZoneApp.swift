//
//  Zen_ZoneApp.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/9/23.
//

import SwiftUI

@main
struct Zen_ZoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
