//
//  VCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI

struct VCard: View {
    @State private var isPresenting = false

    var activity: activitySection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(activity.title)
                .customFont(.title2, fontSize: 24)
                .frame(maxWidth: 170, alignment: .leading)
            Text(activity.caption)
                .customFont(.subheadline, fontSize: 15)
                .opacity(0.7)
            Text("\(activity.points) Point - \(activity.type) activity")
                .customFont(.footnote2, fontSize: 13)
        }
        .onTapGesture {
            isPresenting.toggle()
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 200, height: 240)
        .background(.linearGradient(colors: [activity.color, activity.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: activity.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: activity.color.opacity(0.3), radius: 2, x: 0, y: 1)
        .overlay(
            activity.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .foregroundColor(.white)
                .padding(20)
        )
        .fullScreenCover(isPresented: $isPresenting) {
            ActivityView(activity: activity, isPresenting: $isPresenting)
        }
    }
}

struct VCard_Previews: PreviewProvider {
    static var previews: some View {
        VCard(activity: activities[0])
    }
}
