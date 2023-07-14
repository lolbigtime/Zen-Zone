//
//  HomeView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI

struct HomeView: View {
    var weeklies = activities.filter { $0.type == "Weekly" }
    var dailies = activities.filter { $0.type == "Daily" }
    var wdetail = details.filter {$0.type == "Weekly"}
    var ddetail = details.filter {$0.type == "Daily"}
    
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
                ZStack {
                    ForEach(weeklies) { activity in HCard(activity: activity)}
                    ForEach(wdetail) { detail in DetailedView(detail:detail)}
                }
                .padding(.leading, 20)
                .padding(.bottom, 10)
            }
            
            Text("Daily Activities")
                .customFont(.title3, fontSize: 20)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    ForEach(dailies) { activity in
                        VCard(activity: activity)
                    }
                    .padding(20)
                    .padding(.bottom, 10)
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
