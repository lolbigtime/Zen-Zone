//
//  CategoryView.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/21/23.
//

import SwiftUI

struct CategoryView: View {
    var category: String
    @Binding var activities: [ActivitySection]
    var categoryActivities: [ActivitySection] {
        return activityManager.shared.activities.filter { $0.category == category }
    }
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(category)
                        .customFont(.largeTitle, fontSize: 34)
                        .padding(.horizontal, 20)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(categoryActivities, id: \.id) { activity in
                            VCard(activitySections: $activities, activity: activity)
                                .scaleEffect(0.8)
                                .padding(.vertical, -20)
                        }
                    }
                    .padding()
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
    }
}
