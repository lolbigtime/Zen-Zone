//
//  HomeView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresenting = false
    @State private var isPresented = false

    var weeklies = activities.filter { $0.type == "Weekly" }
    var dailies = activities.filter { $0.type == "Daily" }

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                content
            }
        }
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Categories")
                .customFont(.footnote2, fontSize: 13)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(options) { option in CCard(option: option)}
                }
                .padding(.leading, 20)
                .padding(.bottom, 10)
            }
            
            Text("Weekly Activities")
                .customFont(.largeTitle, fontSize: 34)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    ForEach(weeklies) { activity in HCard(activity: activity)}
                    Button("Start") {
                        isPresenting.toggle()
                    }
                    .padding(.top, 200)
                    .padding(.trailing, 0)
                    .foregroundColor(.white)
                    .fullScreenCover(isPresented: $isPresenting,
                                     onDismiss: didDismiss) {
                        VStack {
                            Text("Practicing Gratitude")
                                .foregroundColor( .white)
                                .font(.bold(.largeTitle)())
                            Spacer()
                                .frame(maxHeight:30)
                            Text("One activity that can help improve your mental health is practicing gratitude. Taking a few minutes each day to reflect on the things you are grateful for can help shift your focus to positive experiences and promote a more optimistic outlook.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 300)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                            Spacer()
                                .frame(maxHeight:30)
                            Text("**3 Points - Weekly activity**")
                                .customFont(.body, fontSize: 20)
                            Spacer()
                                .frame(maxHeight:40)
                            Text("Tap to Close")
                        }
                        .onTapGesture {
                            isPresenting.toggle()
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                        .background(Color.blue)
                        .ignoresSafeArea(edges: .all)
                    }                }
                .padding(.leading, 20)
                .padding(.bottom, 10)
            }
            
            Text("Daily Activities")
                .customFont(.title3, fontSize: 20)
                .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    ForEach(dailies) { activity in
                        VCard(activity: activity)
                    Button("Start") {
                            isPresented.toggle()
                        }
                        .padding(.top, 200)
                        .padding(.trailing, 0)
                        .foregroundColor(.white)
                        .fullScreenCover(isPresented: $isPresented,
                                         onDismiss: completeDismiss) {
                            VStack {
                                Text("Mindful Breathing")
                                    .foregroundColor( .white)
                                    .font(.bold(.largeTitle)())
                                Spacer()
                                    .frame(maxHeight:30)
                                Text("Practice mindful breathing. This simple practice can help promote relaxation, reduce stress, and improve overall well-being. Encourage yourself to practice mindful breathing whenever you feel overwhelmed or need a quick break during the day.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: 300)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                Spacer()
                                    .frame(maxHeight:30)
                                Text("1 Point - Daily activity")
                                    .customFont(.title, fontSize: 20)
                                Spacer()
                                    .frame(maxHeight:40)
                                Text("Tap to Close")
                            }
                            .onTapGesture {
                                isPresented.toggle()
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity)
                            .background(Color.pink)
                            .ignoresSafeArea(edges: .all)                    }
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
        }
    }
    func didDismiss() {
        // Handle the dismissing action.
    }
    func completeDismiss() {
        // Handle the dismissing action.
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
