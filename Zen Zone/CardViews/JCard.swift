//
//  JCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/13/23.
//

import SwiftUI

struct JCard: View {
    @ObservedObject var savedEntries: SavedEntries
    var sectionIndex: Int
    @Binding var refresh: Bool

    
    
    var dateComponentsNow = Calendar.current.dateComponents([.year, .month, .weekday, .day], from: Date.now)
    func abMonth(dc: DateComponents) -> String {
        let monthName = DateFormatter().shortMonthSymbols[(dc.month)! - 1]
        
        return monthName.uppercased()
    }
    func abDay(dc: DateComponents) -> String {
        let dayName = DateFormatter().weekdaySymbols[(dc.weekday)! - 1]
        
        return dayName
    }
    
    var body: some View {
        GeometryReader { Geo in
            VStack(alignment: .leading) {
                headerView
                
                VStack {
                    
                    ForEach(savedEntries.entrySections[sectionIndex].items, id: \.id) { item in
                        ECard(sectionEntries: savedEntries, sectionIndex: sectionIndex, entryIndex: savedEntries.entrySections[sectionIndex].items.firstIndex(where: { $0.id == item.id })!, refresh: $refresh)
                            .frame(width: Geo.size.width-40)
                            .frame(height: item.type == "photo" ? 280 : item.type == "journal" ? 240 : 160)

                            .foregroundColor(.white)
                            .background(.white)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 12)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                            .padding(.vertical, 8)
                        
                        
                    }
                    
                    Spacer()

                }
            }
            .padding(.all, 20)
        }
    }
    
    var headerView: some View {
        HStack(spacing: 15) {
            dateView
            VStack(alignment: .leading, spacing: 0) {
                Text(getDateString(from: savedEntries.entrySections[sectionIndex].date))
                    .customFont(.title2, fontSize: 20)
                    .frame(maxHeight: 30)
                Text(abDay(dc: savedEntries.entrySections[sectionIndex].date))
                    .customFont(.subheadline2, fontSize: 10)
                    .foregroundColor(.black.opacity(0.7))
            }
        }
    }
    var dateView: some View {
        VStack {
            Text(String(savedEntries.entrySections[sectionIndex].date.day ?? 0))
                .customFont(.subheadline2, fontSize: 15)
            Text(abMonth(dc: savedEntries.entrySections[sectionIndex].date))
                .customFont(.body, fontSize: 12)
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(Color(.systemGray).opacity(0.1))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))

    }
    
    
    func getDateString(from dateComponents: DateComponents) -> String {
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents) ?? Date()
        
        let formatter = DateFormatter()
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return "A few days ago"
        }
        
    }
    
   
}


