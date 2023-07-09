//
//  ECard.swift
//  Zen Zone
//
//  Created by Tai Wong on 7/6/23.
//

import SwiftUI

struct ECard: View {
    @State var journalEntry: EntryItem
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 10) {
                    Image(systemName: "person.fill")
                        .frame(width: 40, height: 40)
                        .background(Color("Background 3").opacity(0.02))
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 4)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        switch journalEntry.type {
                        case "text":
                            Text(journalEntry.mood)
                                .customFont(.title2, fontSize: 18)
                                .foregroundColor(.black.opacity(0.7))
                        default:
                            Text("Photo")
                                .customFont(.title2, fontSize: 18)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        

                        Text(getTimeOfDay(from: journalEntry.date))
                            .customFont(.subheadline2, fontSize: 10)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    Spacer()
                }
                
                if journalEntry.type == "photo" {
                    Image(uiImage: journalEntry.image!)
                        .resizable()
                        .frame(width: geometry.size.width - 40, height: 200)
                        .scaledToFill()
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(journalEntry.activities, id: \.self) { item in
                                HStack(alignment: .center) {
                                    Text(item)
                                        .customFont(.title, fontSize: 14)
                                        .lineLimit(1)
                                        .padding()
                                }
                                .frame(height: 30)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white.opacity(0.9))
                                .background(Color.blue.opacity(0.9))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(journalEntry.feelings, id: \.self) { item in
                                HStack(alignment: .center) {
                                    Text(item)
                                        .customFont(.title, fontSize: 14)
                                        .lineLimit(1)
                                        .padding()
                                }
                                .frame(height: 30)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white.opacity(0.9))
                                .background(Color.red.opacity(0.9))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                }
                
            }
            .padding()
        }
        
       // .padding()
    }
    
   
    
    func getTimeOfDay(from dateComponent: DateComponents) -> String {
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        
        let date = calendar.date(from: dateComponent) ?? Date()
        return formatter.string(from: date)
    }
}

struct ECard_Previews: PreviewProvider {
    static var previews: some View {
        var entryitem = EntryItem(mood: "Great!", activities: ["Coding"], feelings: ["Tired"], title: "Coding baby!!!", notes: "Need to do USACO", type: "photo", date: Calendar.current.dateComponents([.year, .month, .weekday, .day, .hour, .minute], from: Date.now))
        entryitem.image = UIImage(named: "FLL")
        
        return ECard(journalEntry: entryitem)
        
    }
}
