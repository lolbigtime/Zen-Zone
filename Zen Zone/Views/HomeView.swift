//
//  HomeView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI
import Foundation

struct HomeView: View {    
    @State var weeklies = activityManager.shared.activities.filter { $0.type == "Weekly" }
    @State var dailies = activityManager.shared.activities.filter { $0.type == "Daily" }
    @State var activities = activityManager.shared.activities
    
    @AppStorage("Points") var points = UserDefaults.standard.integer(forKey: "Points")
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Spacer()
                Text("Drops: \(points)")
                    .customFont(.title2, fontSize: 12)
                    .onAppear {
                        points = UserDefaults.standard.integer(forKey: "Points")
                        print(points)
                    }
                Image(systemName: "drop.halffull")

            }
            .padding(.trailing, 20)
            
            Text("Categories")
                .customFont(.footnote2, fontSize: 13)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(options) { option in
                        CCard(option: option, activitySections: $activities)
                    }
                    
                }
                .padding(.leading, 20)
                .padding(.bottom, 10)
            }
            
            Text("Weekly Activities")
                .customFont(.largeTitle, fontSize: 34)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(weeklies, id: \.id) { activity in HCard(activitySections: $weeklies, activity:activity)}
                }
                
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.bottom, 20)
            }
            
            Text("Daily Activities")
                .customFont(.title3, fontSize: 20)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dailies, id: \.id) { activity in
                        VCard(activitySections: $dailies, activity: activity)}
                            
                    }
                    .padding(.bottom, 10)
                    .padding(20)
                }
            }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
