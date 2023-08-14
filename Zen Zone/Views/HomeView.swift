//
//  HomeView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI
import Foundation

struct HomeView: View {
    var weeklies = activities.filter { $0.type == "Weekly" }
    var dailies = activities.filter { $0.type == "Daily" }
    
    var sdailies = stores.filter { $0.type == "Daily"}
    var sweeklies = stores.filter {$0.type == "Weekly"}
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
            Text("Points: \(points)")
                .onAppear {
                    points = UserDefaults.standard.integer(forKey: "Points")
                    print(points)
                }
            Text("Categories")
                .customFont(.footnote2, fontSize: 13)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(options) { option in CCard(option: option)}
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
                    ForEach(weeklies, id: \.id) { activity in HCard(activity:activity)}
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
                    ForEach(dailies) { activity in
                        VCard(activity: activity)}
                    .padding(20)
                    .padding(.bottom, 10)
                }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(sdailies) {activity in
                        SCard(store: activity)}
                    .padding(20)
                    .padding(.bottom, 10)
                        }
                    }
                }
            }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
