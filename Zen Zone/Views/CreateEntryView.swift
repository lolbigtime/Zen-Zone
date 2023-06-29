//
//  CreateEntryView.swift
//  Zen Zone
//
//  Created by Tai Wong on 6/20/23.
//

import SwiftUI

struct CreateEntryView: View {
    @State private var presentStage = 0
    
    @State private var selectedCategories: [String] = []
    @State private var selectedFeelings: [String] = []
    @State private var title: String = ""
    @State private var notes = "Write some notes..."
    @State private var progress: CGFloat = 0.4
    
    @Binding var entry: [EntryItem]
    @Binding var isOn: Bool
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
                    if presentStage > 0 {
                        BButton
                    }
                    Spacer()
                    XButton
                }
                .padding(20)
                
                if #available(iOS 16.0, *) {
                    if presentStage == 0 {
                        Text("Good Morning, John! \n How are you feeling?")
                            .customFont(.title2, fontSize: 24)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        ZStack {
                            WaveShapeView(progress: $progress)
                            
                            Image("test")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaleEffect(3.5)
                                .allowsHitTesting(false)
                            
                        }
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.1)) {
                                presentStage += 1
                            }
                            
                        }) {
                            Text("Continue")
                                .customFont(.title2, fontSize: 20)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(30)
                        }
                        .padding(40)
                        
                    } else if presentStage == 1 {
                        
                        Text("That's great to hear! \n Whats making your day really great?")
                            .customFont(.title2, fontSize: 24)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        GeometryReader { geometry in
                            
                            let buttonHeight = min((geometry.size.height - 30) / 3, (geometry.size.width - 30) / 3)
                            
                            TabView {
                                HStack {
                                    Spacer()
                                    VStack(alignment: .center, spacing: 10) {
                                        HStack(spacing: 10) {
                                            SButtonView(category: "school", isSelected: selectedCategories.contains("School")) {
                                                if selectedCategories.contains("School") {
                                                    selectedCategories.removeAll(where: {$0 == "School"})
                                                } else {
                                                    selectedCategories.append("School")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            
                                            SButtonView(category: "work", isSelected: selectedCategories.contains("Work")) {
                                                if selectedCategories.contains("Work") {
                                                    selectedCategories.removeAll(where: {$0 == "Work"})
                                                } else {
                                                    selectedCategories.append("Work")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "gaming", isSelected: selectedCategories.contains("Gaming")) {
                                                if selectedCategories.contains("Gaming") {
                                                    selectedCategories.removeAll(where: {$0 == "Gaming"})
                                                } else {
                                                    selectedCategories.append("Gaming")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                        }
                                        HStack(spacing: 10) {
                                            SButtonView(category: "friends", isSelected: selectedCategories.contains("Friends")) {
                                                if selectedCategories.contains("Friends") {
                                                    selectedCategories.removeAll(where: {$0 == "Friends"})
                                                } else {
                                                    selectedCategories.append("Friends")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "relationship", isSelected: selectedCategories.contains("Relationship")) {
                                                if selectedCategories.contains("Relationship") {
                                                    selectedCategories.removeAll(where: {$0 == "Relationship"})
                                                } else {
                                                    selectedCategories.append("Relationship")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "family", isSelected: selectedCategories.contains("Family")) {
                                                if selectedCategories.contains("Family") {
                                                    selectedCategories.removeAll(where: {$0 == "Family"})
                                                } else {
                                                    selectedCategories.append("Family")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                        }
                                        HStack(spacing: 10) {
                                            SButtonView(category: "relaxing", isSelected: selectedCategories.contains("Relaxing")) {
                                                if selectedCategories.contains("Relaxing") {
                                                    selectedCategories.removeAll(where: {$0 == "School"})
                                                } else {
                                                    selectedCategories.append("School")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "hobbies", isSelected: selectedCategories.contains("Hobbies")) {
                                                if selectedCategories.contains("Hobbies") {
                                                    selectedCategories.removeAll(where: {$0 == "Hobbies"})
                                                } else {
                                                    selectedCategories.append("Hobbies")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "exercise", isSelected: selectedCategories.contains("Exercise")) {
                                                if selectedCategories.contains("Exercise") {
                                                    selectedCategories.removeAll(where: {$0 == "Exercise"})
                                                } else {
                                                    selectedCategories.append("Exercise")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                        }
                                    }
                                    Spacer()
                                }
                                
                                VStack(spacing: 10) {
                                    HStack(spacing: 10) {
                                        SButtonView(category: "sports", isSelected: selectedCategories.contains("Sports")) {
                                            if selectedCategories.contains("Sports") {
                                                selectedCategories.removeAll(where: {$0 == "Sports"})
                                            } else {
                                                selectedCategories.append("Sports")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "food", isSelected: selectedCategories.contains("Food")) {
                                            if selectedCategories.contains("Food") {
                                                selectedCategories.removeAll(where: {$0 == "Food"})
                                            } else {
                                                selectedCategories.append("Food")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "sleep", isSelected: selectedCategories.contains("Sleep")) {
                                            if selectedCategories.contains("Sleep") {
                                                selectedCategories.removeAll(where: {$0 == "Sleep"})
                                            } else {
                                                selectedCategories.append("Sleep")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                    }
                                    HStack(spacing: 10) {
                                        SButtonView(category: "music", isSelected: selectedCategories.contains("Music")) {
                                            if selectedCategories.contains("Music") {
                                                selectedCategories.removeAll(where: {$0 == "Music"})
                                            } else {
                                                selectedCategories.append("Music")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "weather", isSelected: selectedCategories.contains("Weather")) {
                                            if selectedCategories.contains("Weather") {
                                                selectedCategories.removeAll(where: {$0 == "Weather"})
                                            } else {
                                                selectedCategories.append("Weather")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "other", isSelected: selectedCategories.contains("Other")) {
                                            if selectedCategories.contains("Other") {
                                                selectedCategories.removeAll(where: {$0 == "Other"})
                                            } else {
                                                selectedCategories.append("Other")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                    }
                                    
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            
                            
                            
                        }
                        .padding()
                        
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.1)) {
                                presentStage += 1
                            }
                        }) {
                            Text("Continue")
                                .customFont(.title2, fontSize: 20)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedCategories.isEmpty ? Color("Background 3") : Color.blue)
                                .cornerRadius(30)
                        }
                        .padding(40)
                        .disabled(selectedCategories.isEmpty ? true : false)
                        
                        
                    } else if presentStage == 2 {
                        Text("And... \n how are you feeling?")
                            .customFont(.title2, fontSize: 24)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        GeometryReader { geometry in
                            
                            let buttonHeight = min((geometry.size.height - 30) / 3, (geometry.size.width - 30) / 3)
                            
                            TabView {
                                HStack {
                                    Spacer()
                                    VStack(alignment: .center, spacing: 10) {
                                        HStack(spacing: 10) {
                                            SButtonView(category: "happy", isSelected: selectedFeelings.contains("Happy")) {
                                                if selectedFeelings.contains("Happy") {
                                                    selectedFeelings.removeAll(where: {$0 == "Happy"})
                                                } else {
                                                    selectedFeelings.append("Happy")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            
                                            SButtonView(category: "good", isSelected: selectedFeelings.contains("Good")) {
                                                if selectedFeelings.contains("Good") {
                                                    selectedFeelings.removeAll(where: {$0 == "Good"})
                                                } else {
                                                    selectedFeelings.append("Good")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "sad", isSelected: selectedFeelings.contains("Sad")) {
                                                if selectedFeelings.contains("Sad") {
                                                    selectedFeelings.removeAll(where: {$0 == "Sad"})
                                                } else {
                                                    selectedFeelings.append("Sad")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                        }
                                        HStack(spacing: 10) {
                                            SButtonView(category: "angry", isSelected: selectedFeelings.contains("Angry")) {
                                                if selectedFeelings.contains("Angry") {
                                                    selectedFeelings.removeAll(where: {$0 == "Angry"})
                                                } else {
                                                    selectedFeelings.append("Angry")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "confused", isSelected: selectedFeelings.contains("Confused")) {
                                                if selectedFeelings.contains("Confused") {
                                                    selectedFeelings.removeAll(where: {$0 == "Confused"})
                                                } else {
                                                    selectedFeelings.append("Confused")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "bored", isSelected: selectedFeelings.contains("Bored")) {
                                                if selectedFeelings.contains("Bored") {
                                                    selectedFeelings.removeAll(where: {$0 == "Bored"})
                                                } else {
                                                    selectedFeelings.append("Bored")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                        }
                                        HStack(spacing: 10) {
                                            SButtonView(category: "stressed", isSelected: selectedFeelings.contains("Stressed")) {
                                                if selectedFeelings.contains("Stressed") {
                                                    selectedFeelings.removeAll(where: {$0 == "Stressed"})
                                                } else {
                                                    selectedFeelings.append("Stressed")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "nervous", isSelected: selectedFeelings.contains("Nervous")) {
                                                if selectedFeelings.contains("Nervous") {
                                                    selectedFeelings.removeAll(where: {$0 == "Nervous"})
                                                } else {
                                                    selectedFeelings.append("Nervous")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                            SButtonView(category: "embarrassed", isSelected: selectedFeelings.contains("Embarrassed")) {
                                                if selectedFeelings.contains("Embarrassed") {
                                                    selectedFeelings.removeAll(where: {$0 == "Embarrassed"})
                                                } else {
                                                    selectedFeelings.append("Embarrassed")
                                                }
                                            }
                                            .frame(width: buttonHeight, height: buttonHeight)
                                        }
                                    }
                                    Spacer()
                                }
                                
                                VStack(spacing: 10) {
                                    HStack(spacing: 10) {
                                        SButtonView(category: "lucky", isSelected: selectedFeelings.contains("Lucky")) {
                                            if selectedFeelings.contains("Lucky") {
                                                selectedFeelings.removeAll(where: {$0 == "Lucky"})
                                            } else {
                                                selectedFeelings.append("Lucky")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "lonely", isSelected: selectedFeelings.contains("Lonely")) {
                                            if selectedFeelings.contains("Lonely") {
                                                selectedFeelings.removeAll(where: {$0 == "Lonely"})
                                            } else {
                                                selectedFeelings.append("Lonely")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "curious", isSelected: selectedFeelings.contains("Curious")) {
                                            if selectedFeelings.contains("Curious") {
                                                selectedFeelings.removeAll(where: {$0 == "Curious"})
                                            } else {
                                                selectedFeelings.append("Curious")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                    }
                                    HStack(spacing: 10) {
                                        SButtonView(category: "alright", isSelected: selectedFeelings.contains("Alright")) {
                                            if selectedFeelings.contains("Alright") {
                                                selectedFeelings.removeAll(where: {$0 == "Alright"})
                                            } else {
                                                selectedFeelings.append("Alright")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "playful", isSelected: selectedFeelings.contains("Playful")) {
                                            if selectedFeelings.contains("Playful") {
                                                selectedFeelings.removeAll(where: {$0 == "Playful"})
                                            } else {
                                                selectedFeelings.append("Playful")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                        SButtonView(category: "other", isSelected: selectedFeelings.contains("Other")) {
                                            if selectedFeelings.contains("other") {
                                                selectedFeelings.removeAll(where: {$0 == "Other"})
                                            } else {
                                                selectedFeelings.append("Other")
                                            }
                                        }
                                        .frame(width: buttonHeight, height: buttonHeight)
                                    }
                                    
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            
                            
                            
                        }
                        .padding()
                        
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.1)) {
                                presentStage += 1
                            }
                        }) {
                            Text("Continue")
                                .customFont(.title2, fontSize: 20)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedFeelings.isEmpty ? Color("Background 3") : Color.blue)
                                .cornerRadius(30)
                        }
                        .padding(40)
                        .disabled(selectedFeelings.isEmpty ? true : false)

                        
                    } else if presentStage == 3 {
                        ScrollView {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(formatDate(currentDate))
                                        .customFont(.title2, fontSize: 26)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                    
                                    Text("Activities")
                                        .customFont(.title2, fontSize: 22)
                                        .foregroundColor(.white.opacity(0.9))
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 10) {
                                            ForEach(selectedCategories, id: \.self) { category in
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
                                            ForEach(selectedFeelings, id: \.self) { emotion in
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
                                    Spacer()
                                        .frame(height: 30)
                                    TextField("", text: $title, prompt:
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
                                    TextEditor(text: $notes)
                                        .padding()
                                        .foregroundColor(.white)
                                        .frame(height: 225)
                                        .background(Color("Background 3"))
                                        .accentColor(Color.white)
                                        .scrollContentBackground(.hidden)
                                        .cornerRadius(10)
                                    
                                    
                                }
                                
                                Spacer()
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            Button(action: {
                                withAnimation(.easeOut(duration: 0.1)) {
                                    presentStage += 1
                                    var mood = "Okay"
                                    if progress >= 0.9 {
                                        mood = "Amazing"
                                    } else if progress >= 0.8 {
                                        mood = "Great"
                                    } else if progress >= 0.6 {
                                        mood = "Good"
                                    } else if progress >= 0.4 {
                                        mood = "Okay"
                                    } else if progress >= 0.2 {
                                        mood = "Meh"
                                    } else if progress >= 0.1 {
                                        mood = "Bad"
                                    } else if progress >= 0.0 {
                                        mood = "Terrible"
                                    }
                                    
                                    let entryItem = EntryItem(mood: mood, activities: selectedCategories, feelings: selectedFeelings, title: title, notes: notes, type: "text", date: Calendar.current.dateComponents([.year, .month, .weekday, .day], from: Date.now))
                                    entry.append(entryItem)
                                    isOn = false
                                }
                            }) {
                                Text("Complete Check-In")
                                    .customFont(.title2, fontSize: 20)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(title == "" ? Color("Background 3") : Color.blue)
                                    .cornerRadius(30)
                            }
                            .padding(40)
                            .disabled(title == "" ? true : false)

                                                        
                        }
                    }
                }
                                
                Spacer()
            }
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
    var BButton: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 0.1)) {
                presentStage -= 1
            }
        }) {
            ZStack {
                
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white.opacity(0.75))
            }
        }
    }
    
}


