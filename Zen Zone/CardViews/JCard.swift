//
//  JCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/13/23.
//

import SwiftUI

struct JCard: View {
    @Binding var entry: EntrySection
    
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
                    ForEach(entry.items, id: \.id) { item in
                        ECard(journalEntry: item)
                            .frame(width: Geo.size.width-40)
                            .frame(height: item.type == "photo" ? 280 : 160)

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
                Text(getDateString(from: entry.date))
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

struct JCard_Previews: PreviewProvider {
    static var previews: some View {
        var entryitem = EntryItem(mood: "Great!", activities: ["Coding"], feelings: ["Tired"], title: "Coding baby!!!", notes: "Need to do USACO", type: "text", date: Calendar.current.dateComponents([.year, .month, .weekday, .day, .hour, .minute], from: Date.now))
        entryitem.image = UIImage(named: "FLL")
        
        @State var sect = EntrySection(date: Calendar.current.dateComponents([.year, .month, .weekday, .day], from: Date.now), items: [entryitem], mood: 0, photos: 1, journal: 0)
        return JCard(entry: $sect)
        
    }
}
