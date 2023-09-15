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
            HStack {
                Spacer()
                XButton
            }
            .padding(20)
                        
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
            
            Button(Completed ? "Completed" : "Complete") {
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
            .customFont(.title2, fontSize: 20)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Completed ? Color("Background 3") : Color.white.opacity(0.2))
            .cornerRadius(30)
            .padding(.horizontal, 20)
            .disabled(Completed)
            
            Spacer()
                .frame(maxHeight:40)
            
        }
        .onAppear {
            let completedActivitiesList = UserDefaults.standard.array(forKey: "completedActivities") ?? []
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
    
    var XButton: some View {
        Button(action: {
            isPresenting = false
            
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 50, height: 50)
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

