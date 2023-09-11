//
//  ECard.swift
//  Zen Zone
//
//  Created by Tai Wong on 7/6/23.
//

import SwiftUI

struct ECard: View {
    @ObservedObject var sectionEntries: SavedEntries
    @State var isPresented = false
    
    var sectionIndex: Int
    var entryIndex: Int
    @Binding var refresh: Bool
    
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
                        switch sectionEntries.entrySections[sectionIndex].items[entryIndex].type {
                        case "text":
                            Text(sectionEntries.entrySections[sectionIndex].items[entryIndex].mood)
                                .customFont(.title2, fontSize: 18)
                                .foregroundColor(.black.opacity(0.7))
                        case "journal":
                            Text(sectionEntries.entrySections[sectionIndex].items[entryIndex].title)
                                .customFont(.title2, fontSize: 18)
                                .foregroundColor(.black.opacity(0.7))
                        default:
                            Text("Photo")
                                .customFont(.title2, fontSize: 18)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        

                        Text(getTimeOfDay(from: sectionEntries.entrySections[sectionIndex].items[entryIndex].date))
                            .customFont(.subheadline2, fontSize: 10)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    Spacer()
                }
                
                if sectionEntries.entrySections[sectionIndex].items[entryIndex].type == "photo" {
                    Image(uiImage: sectionEntries.entrySections[sectionIndex].items[entryIndex].image!)
                        .resizable()
                        .frame(width: geometry.size.width - 40, height: 200)
                        .scaledToFill()
                } else if sectionEntries.entrySections[sectionIndex].items[entryIndex].type == "text" {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(sectionEntries.entrySections[sectionIndex].items[entryIndex].activities, id: \.self) { item in
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
                    //force reload, because it isnt counting for te entry iten
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(sectionEntries.entrySections[sectionIndex].items[entryIndex].feelings, id: \.self) { item in
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
                } else {
                    Text(sectionEntries.entrySections[sectionIndex].items[entryIndex].notes)
                        .customFont(.body, fontSize: 16)
                        .padding(10)
                        //.fixedSize()
                        .foregroundColor(.black)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(5)
                    
    
                }
                
            }
            .padding()
            .fullScreenCover(isPresented: $isPresented) {
                EntryView(refresh: $refresh, isOn: $isPresented, savedEntries: sectionEntries, sectionIndex: sectionIndex, itemIndex: entryIndex)
            }
            .onTapGesture {
                withAnimation {
                    isPresented.toggle()
                }
            }
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
/*
struct ECard_Previews: PreviewProvider {
    static var previews: some View {
        var entryitem = EntryItem(mood: "Great!", activities: ["Coding"], feelings: ["Tired"], title: "hello", notes: "ifhihdiuashidhasiudhiasuhdiuashdiusahiudhsaiudhsaiuhdiusahd", type: "journal", date: Calendar.current.dateComponents([.year, .month, .weekday, .day, .hour, .minute], from: Date.now))
        entryitem.image = UIImage(named: "FLL")
        
        return ECard(journalEntry: entryitem)
        
    }
}
*/
