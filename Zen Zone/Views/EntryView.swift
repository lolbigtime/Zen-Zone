//
//  EntryView.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/5/23.
//

import SwiftUI
import UIKit

struct EntryView: View {
    @Binding var refresh: Bool
    
    @Binding var isOn: Bool
    @ObservedObject var savedEntries: SavedEntries
    var sectionIndex: Int
    var itemIndex: Int
    @State var titleText = ""

    

    private let currentDate = Date.now
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, HH:mm"
        return formatter.string(from: date)
    }
    
    func setImage(category: String) -> Image {
        switch category {
        case "school":
            return Image(systemName: "graduationcap")
        case "work":
            return Image(systemName: "briefcase")
        case "friends":
            return Image(systemName: "person.2")
        case "family":
            return Image(systemName: "house")
        case "relationship":
            return Image(systemName: "heart")
        case "exercise":
            return Image(systemName: "lungs")
        case "food":
            return Image(systemName: "takeoutbag.and.cup.and.straw")
        case "sports":
            return Image(systemName: "figure.basketball")
        case "sleep":
            return Image(systemName: "bed.double")
        case "gaming":
            return Image(systemName: "gamecontroller")
        case "music":
            return Image(systemName: "headphones")
        case "hobbies":
            return Image(systemName: "brain.head.profile")
        case "weather":
            return Image(systemName: "sun.max")
        case "relaxing":
            return Image(systemName: "beach.umbrella")
        case "other":
            return Image(systemName: "plus")
        default:
            return Image(systemName: "lightbulb.max")
            
        }
    }
    
    var body: some View {
        ZStack {
            Color("Background 2").ignoresSafeArea()
            VStack {
                HStack {
                    
                    Spacer()
                    XButton
                }
                .padding(20)
                
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            
                            if savedEntries.entrySections[sectionIndex].items[itemIndex].type == "journal" {
                                Text("Journal for:")
                                    .customFont(.title2, fontSize: 22)
                                    .foregroundColor(.white)
                                
                            }
                            
                            Text(formatDate(currentDate))
                                .customFont(.title2, fontSize: 26)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                            
                            if savedEntries.entrySections[sectionIndex].items[itemIndex].type == "text" {
                                Text("Activities")
                                    .customFont(.title2, fontSize: 22)
                                    .foregroundColor(.white.opacity(0.9))
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(savedEntries.entrySections[sectionIndex].items[itemIndex].activities, id: \.self) { category in
                                            HStack {
                                                setImage(category: category.lowercased())
                                                    .font(.system(size: 20, weight: .bold))
                                                    .frame(height: 30)
                                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                                
                                                Text(category)
                                                    .customFont(.title, fontSize: 14)
                                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10))
                                                
                                            }
                                            .foregroundColor(.white.opacity(0.9))
                                            .background(Color.blue.opacity(0.9))
                                            .cornerRadius(20)
                                        }
                                    }
                                }
                                
                                Text("Feelings")
                                    .customFont(.title2, fontSize: 22)
                                    .foregroundColor(.white.opacity(0.9))
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(savedEntries.entrySections[sectionIndex].items[itemIndex].feelings, id: \.self) { emotion in
                                            HStack {
                                                setImage(category: emotion.lowercased())
                                                    .font(.system(size: 20, weight: .bold))
                                                    .frame(height: 30)
                                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                                
                                                Text(emotion)
                                                    .customFont(.title, fontSize: 14)
                                                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10))
                                                
                                            }
                                            .foregroundColor(.white.opacity(0.9))
                                            .background(Color.blue.opacity(0.9))
                                            .cornerRadius(20)
                                            
                                        }
                                    }
                                }
                            }
                            
                            
                            Spacer()
                                .frame(height: 30)
                            
                            if (savedEntries.entrySections[sectionIndex].items[itemIndex].type == "journal") || (savedEntries.entrySections[sectionIndex].items[itemIndex].type == "text") {
                                TextField("", text: $titleText, prompt:
                                            Text("Write your title here!")
                                    .foregroundColor(Color.white)
                                )
                                .bold()
                                .padding()
                                .background(Color("Background 3"))
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .accentColor(Color.white)
                                Spacer()
                                    .frame(height: 20)
                                TextEditor(text: $savedEntries.entrySections[sectionIndex].items[itemIndex].notes)
                                    .padding()
                                    .foregroundColor(.white)
                                    .frame(height: 225)
                                    .background(Color("Background 3"))
                                    .accentColor(Color.white)
                                    .scrollContentBackground(.hidden)
                                    .cornerRadius(10)
                                
                                Button(action: {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        savedEntries.entrySections[sectionIndex].items[itemIndex].title = titleText
                                        savedEntries.saveEntrySections()
                                        refresh = true
                                        isOn = false
                                    }
                                }) {
                                    Text("Done")
                                        .customFont(.title2, fontSize: 20)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .cornerRadius(30)
                                }
                                .padding(40)
                                
                            } else {
                                GeometryReader { geo in
                                    Image(uiImage: savedEntries.entrySections[sectionIndex].items[itemIndex].image!)
                                        .resizable()
                                        //.frame(width: geo.size.width, height: 500)
                                        .scaledToFill()
                                        .cornerRadius(10)
                                }
                                
                            }
                            
                            
                            
                        }
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    

                                                
                }
                                
                Spacer()
            }
        }
        .onAppear {
           // savedEntries.loadEntrySections()
            titleText = savedEntries.entrySections[sectionIndex].items[itemIndex].title
        }
    }
    
    var XButton: some View {
        Button(action: {
            isOn = false
            
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 50, height: 50)
                Image(systemName: "xmark")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}
/*
struct EntryView_Previews: PreviewProvider {
    static var previews: some View {

        var item = EntryItem(mood: "Great!", activities: ["Coding"], feelings: ["Tired"], title: "Coding baby!!!", notes: "Need to do USACO", type: "photo", date: Calendar.current.dateComponents([.year, .month, .weekday, .day, .hour, .minute], from: Date.now))
        item.image = UIImage(named: "FLL")
        
        return EntryView(entryItem: item, isOn: .constant(true))
    }
}
*/
//dynamic refresh and fix title glitch idk whats wrong with it
//


//basically, whenever a new section is created or changed, journal view will change.
//the reason why Jcard does refresh with it is because the state object is from Journal View, thus, only journal view is refresh and the view that creates the card, AKA JCard and ECard are not changed
//nevermind, just test in the other project using the EntryItem view model to see if structs change behavior. This is weird as frick	
