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
    @State var dailystreak = 0
    @State var weeklystreak = 0
    @State var lastStreakDate: Date?
    @State var WeeklyStreakBought = false
    @State var DailyStreakBought = false
    let itemToCheck = "item123"
    var weeklies = activities.filter { $0.type == "Weekly" }
    var dailies = activities.filter { $0.type == "Daily" }
    var isWeeklyStreakValid: Bool {
        guard let lastDate = lastStreakDate else {
            return false
        }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Calculate the date components between the current date and the last streak date
        let components = calendar.dateComponents([.day], from: lastDate, to: currentDate)
        
        // If the difference is less than or equal to 7 days, the streak is valid
        return components.day ?? 0 <= 7
    }
    var isDailyStreakValid: Bool {
        guard let lastDate = lastStreakDate else {
            return false
        }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        // Calculate the date components between the current date and the last streak date
        let components = calendar.dateComponents([.day], from: lastDate, to: currentDate)
        
        // If the difference is less than or equal to 1 day, the streak is valid
        return components.day ?? 0 <= 1
    }
    
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
                updateStreak()
                checkDailyStreak()
                checkWeeklyStreak()
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
    func resetweeklyStreak() {
        weeklystreak = 0
        lastStreakDate = nil
    }
    func resetdailyStreak() {
        dailystreak = 0
        lastStreakDate = nil
    }
    
    
    func updateStreak() {
        // Call this method when the user completes a task or mission
        if isWeeklyStreakValid == true && activity.type == "weekly"{
            weeklystreak += 1
        }
        else if isDailyStreakValid == true && activity.type == "daily" {
            dailystreak += 1
        }
        else{
            resetdailyStreak()
            resetweeklyStreak()
        }
        lastStreakDate = Date()
    }
    func checkWeeklyStreak() {
        if weeklystreak == 5 && WeeklyStreakBought == true {
            points += 30
        }
        else{
            
        }
    }
    func checkDailyStreak() {
        if dailystreak == 3 && WeeklyStreakBought == true{
            points += 5
        }
        else{
            
        }
    }
}

