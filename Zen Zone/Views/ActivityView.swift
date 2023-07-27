//
//  ActivityView.swift
//  Zen Zone
//
//  Created by Tai Wong on 7/27/23.
//

import SwiftUI

struct ActivityView: View {
    @State var activity: activitySection
    @AppStorage("Points") private var points = UserDefaults.standard.integer(forKey: "Points")
    @State private var Completed = false
    @Binding var isPresenting: Bool
    
    
    var body: some View {
        VStack {
            Text(activity.title)
                .foregroundColor( .white)
                .font(.bold(.largeTitle)())
            Spacer()
                .frame(maxHeight:30)
            Text(activity.caption)
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            Spacer()
                .frame(maxHeight: 30)
            Text("\(activity.points) Point - \(activity.type) activity")
                .customFont(.body, fontSize: 20)
            Spacer()
                .frame(maxHeight: 40)
            Button("Complete") {
        
                points += activity.points
                UserDefaults.standard.set(points, forKey: "Points")
                
                var completedActivitiesList = UserDefaults.standard.array(forKey: "completedActivities") ?? []
               // if completedActivitiesList.contains(where: { ($0 as? String) == activity.title}) {
                 //   completedActivitiesList.remove(at: completedActivitiesList.firstIndex(where: { ($0 as? String) == activity.title})!)
             //   } else {
                completedActivitiesList.append(activity.title)
                UserDefaults.standard.set(completedActivitiesList, forKey: "completedActivities")
                //}
 
                Completed = true
            }
            .disabled(Completed)
            Spacer()
                .frame(maxHeight:40)
            Text("Tap to Close")
                .onTapGesture {
                    isPresenting.toggle()
                }
        }
        .onAppear {
            var completedActivitiesList = UserDefaults.standard.array(forKey: "completedActivities") ?? []
            if completedActivitiesList.contains(where: { ($0 as? String) == activity.title}) {
                Completed = true
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(activity.color)
        .ignoresSafeArea(edges: .all)
    }
}

