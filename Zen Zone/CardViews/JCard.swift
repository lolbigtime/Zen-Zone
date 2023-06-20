//
//  JCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/13/23.
//

import SwiftUI

struct JCard: View {
    var entry: EntrySection
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
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading) {
                headerView
                
                ForEach(entry.items) { item in
                    Text(item.title)
                }
            }
            .padding(20)
            .padding(.bottom, 10)
        }
        
    }
    /*
    var contentView: some View {
        HStack {
            Image
        }
    }
     */
    var headerView: some View {
        HStack(spacing: 15) {
            dateView
            VStack(alignment: .leading, spacing: 0) {
                Text("Today")
                    .customFont(.title2, fontSize: 20)
                    .opacity(entry.date == dateComponentsNow ? 1 : 0)
                    .frame(maxHeight: entry.date == dateComponentsNow ? 30 : 0)
                Text(abDay(dc: entry.date))
                    .customFont(.subheadline2, fontSize: 10)
                    .foregroundColor(.black.opacity(0.7))
            }
        }
    }
    var dateView: some View {
        VStack {
            Text(String(entry.date.day ?? 0))
                .customFont(.subheadline2, fontSize: 15)
            Text(abMonth(dc: entry.date))
                .customFont(.body, fontSize: 12)
                .foregroundColor(.gray)
        }
        .padding(10)
        .background(Color(.systemGray).opacity(0.1))
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))

    }
    
    
    
}

struct JCard_Previews: PreviewProvider {
    static var previews: some View {
        JCard(entry: jEntries[0])
    }
}
