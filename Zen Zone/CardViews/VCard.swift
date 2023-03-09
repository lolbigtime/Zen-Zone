//
//  VCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI

struct VCard: View {
    var activity: activitySection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(activity.title)
                .customFont(.title2)
                .frame(maxWidth: 170, alignment: .leading)
            Text(activity.caption)
                .customFont(.subheadline)
                .opacity(0.7)
            Text("\(activity.points) Point - \(activity.type) activity")
                .customFont(.footnote2)
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(.linearGradient(colors: [activity.color, activity.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: activity.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: activity.color.opacity(0.3), radius: 2, x: 0, y: 1)
        .overlay(
            activity.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20)
        )
    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard(activity: activities[0])
    }
}
