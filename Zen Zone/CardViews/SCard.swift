//
//  SCard.swift
//  Zen Zone
//
//  Created by Andruw Lin on 9/11/23.
//

import SwiftUI

struct SCard: View {
    @State private var isPresenting = false
    @State private var Bought = false
    @AppStorage("Points") private var points = UserDefaults.standard.integer(forKey: "Points")
    @State var WeeklyStreakBought = false
    @State var DailyStreakBought = false
    var items: StoreItems
    var body: some View {
    
        VStack(alignment: .leading, spacing: 2) {
            Text(items.name)
                .foregroundColor( .white)
                .font(.bold(.largeTitle)())
                .multilineTextAlignment(.leading)
                .frame(maxWidth: 300)
                .padding(.leading, 1)
                .padding(.trailing, 1)
            Spacer()
                .frame(maxHeight:20)
            Text(items.description)
                .customFont(.body, fontSize: 20)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .padding(.leading, 1)
                .padding(.trailing, 1)
                .lineLimit(nil)
            
            Spacer()
                .frame(maxHeight: 20)
            HStack{
                Text("Costs \(items.cost) Points")
                    .customFont(.body, fontSize: 15)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .padding(.leading, 1)
                    .padding(.trailing, 1)
                Spacer()
                    .frame(maxWidth: 2)
                Button("Purchase") {
                    points -= items.cost
                    if items.name == "Weekly Streak"{
                        WeeklyStreakBought = true
                    }
                    else{
                        
                    }
                    if items.name == "Daily Streak"{
                        DailyStreakBought = true
                    }
                    else{
                        
                    }
                    UserDefaults.standard.set(points, forKey: "Points")
                    
                    var completedActivitiesList = UserDefaults.standard.array(forKey: "completedActivities") ?? []
                    UserDefaults.standard.set(completedActivitiesList, forKey: "completedActivities")
                    //}
     
                    Bought = true
                }
                .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
                .disabled(Bought)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                .padding(.leading, 1)
                .padding(.trailing, 1)
            }
            Spacer()
                .frame(maxHeight:20)
        }
        .foregroundColor(.white)
        .padding(0)
        .frame(width: 300, height: 200)
        .background(.linearGradient(colors: [items.color, items.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .shadow(color: items.color.opacity(0.3), radius: 2, x: 0, y: 1)
        
    }
}

struct SCard_Previews: PreviewProvider {
    static var previews: some View {
        SCard(items: items[0])
    }
}
