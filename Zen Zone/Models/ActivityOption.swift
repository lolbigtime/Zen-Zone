//
//  activityOptions.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import Foundation
import SwiftUI

struct activityOption: Identifiable {
    var id = UUID()
    var section: String
    var color: Color
    var image: Image
}

var options = [
    activityOption(section: "Sleep", color: .indigo, image: Image(systemName: "moon.fill")),
    activityOption(section: "Stress", color: .teal, image: Image(systemName: "cloud.fill")),
    activityOption(section: "School", color: .yellow, image: Image(systemName: "graduationcap.fill")),
    activityOption(section: "Pressure", color: .black, image: Image(systemName: "scalemass.fill")),
]
    
