//
//  Message.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/12/23.
//

import Foundation

struct Message: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var text: String
    var user: Bool
    var loading: Bool
}
