//
//  MoodPickerView.swift
//  Zen Zone
//
//  Created by Tai Wong on 6/21/23.
//

import SwiftUI

struct SButtonView: View {
    @State var category: String = "school"
    @State var isSelected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: {
            isSelected.toggle()
            action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(isSelected ? setColor(category: category) : setColor(category: category).opacity(0.5))
                    .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
                VStack {
                    setImage(category: category)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(isSelected ? .white : .white.opacity(0.5))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Text(category)
                        .foregroundColor(isSelected ? .white : .white.opacity(0.5))
                        .customFont(.title2, fontSize: 12)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
                }
                
            }
        }
        
    }
    func setColor(category: String) -> Color {
        switch category {
        case "school":
            return Color.cyan
        case "work":
            return Color.green
        case "friends":
            return Color.orange
        case "family":
            return Color.indigo
        case "relationship":
            return Color.pink
        case "exercise":
            return Color.mint
        case "food":
            return Color.brown
        case "sports":
            return Color.teal
        case "sleep":
            return Color.blue
        case "gaming":
            return Color.black
        case "music":
            return Color.purple
        case "hobbies":
            return Color.red
        case "weather":
            return Color.yellow
        case "relaxing":
            return Color.gray
        case "other":
            return Color.red
        case "happy":
            return Color.cyan
        case "good":
            return Color.green
        case "sad":
            return Color.orange
        case "angry":
            return Color.indigo
        case "confused":
            return Color.pink
        case "bored":
            return Color.mint
        case "stressed":
            return Color.brown
        case "nervous":
            return Color.teal
        case "embarrassed":
            return Color.blue
        case "lucky":
            return Color.black
        case "lonely":
            return Color.purple
        case "curious":
            return Color.red
        case "alright":
            return Color.yellow
        case "playful":
            return Color.gray
            
        default:
            return Color.cyan
            
        }

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
}
