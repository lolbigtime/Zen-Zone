//
//  HCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI

struct HCard: View {
    @State private var isPresenting = false
    @State private var ButtonTap = false
    @AppStorage("tapCount") private var tapCount = 0
    var activity: activitySection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(activity.title)
                .customFont(.title2, fontSize: 24)
                .frame(maxWidth: 210, alignment: .leading)
            Text(activity.caption)
                .customFont(.subheadline, fontSize: 15)
                .opacity(0.7)
            Text("\(activity.points) Point - \(activity.type) activity")
                .customFont(.footnote2, fontSize: 13)
                   }
        .onTapGesture {
            isPresenting.toggle()}
        .fullScreenCover(isPresented: $isPresenting,
                         onDismiss: didDismiss) {
            VStack {
                Text(activity.title)
                    .foregroundColor( .white)
                    .font(.bold(.largeTitle)())
                Spacer()
                    .frame(maxHeight:30)
                Text(activity.body)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Spacer()
                    .frame(maxHeight:30)
                Text("\(activity.points) Point - \(activity.type) activity")
                    .customFont(.body, fontSize: 20)
                Spacer()
                    .frame(maxHeight:40)
                Button("Complete"){
                    tapCount += 1
                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                    ButtonTap = true
                }
                .disabled(ButtonTap == true)
                Spacer()
                    .frame(maxHeight:40)
                Text("Tap to Close")
                    .onTapGesture{isPresenting.toggle()}
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .background(activity.color)
            .ignoresSafeArea(edges: .all)
        }
            .foregroundColor(.white)
            .padding(30)
            .frame(width: 300, height: 240)
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
    func didDismiss() {
        // Handle the dismissing action.
    }
}
    
    struct HCard_Previews: PreviewProvider {
        static var previews: some View {
            HCard(activity: activities[0])
        }
    }
    
