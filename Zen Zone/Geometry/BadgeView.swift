//
//  BadgeView.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/3/23.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        SquareAndTriangle()
            .stroke(Color.blue, lineWidth: 5)
            .frame(width: 150, height: 150)
    }
}

#Preview {
    BadgeView()
}
