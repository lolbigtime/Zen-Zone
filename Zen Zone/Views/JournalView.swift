//
//  JournalView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/12/23.
//

import SwiftUI

struct JournalView: View {
    @State var isShowingView = false
    @StateObject var entrySections = SavedEntries()
    @State var statistics = Statistic(reflections: 0, checkIns: 0, images: 0)
    @State var refresh = false
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text("Entries")
                            .customFont(.largeTitle, fontSize: 34)
                            .padding(.horizontal, 20)
                           
                        statisticsView
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .padding(.top, 10)
                        
                        createView
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .padding(.top, 15)
                        Group {
                            if fetchStats().3 == 0 {
                                
                                GeometryReader { geom in
                                    VStack(alignment: .center) {
                                        Text("No entries,\nfeel free to make some :)")
                                            .customFont(.largeTitle, fontSize: 26)
                                            .multilineTextAlignment(.center)
                                            .fixedSize()

                                    }
                                    .padding(.top, 40)
                                    .frame(width: geom.size.width)
                                }
                                
                                 
                                
                            } else {
                                
                                ForEach(entrySections.entrySections.indices, id: \.self) { index in
                                    JCard(savedEntries: entrySections, sectionIndex: index, refresh: $refresh)
                                        .frame(height: calculateHeight(mood: entrySections.entrySections[index].mood, journal: entrySections.entrySections[index].journal, photo: entrySections.entrySections[index].photos))
                                        
                                        
                                }
                                 
                            }
                        }
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
  
                    }
                    .padding(.top, 20)
                }
            }
            
        }
        .fullScreenCover(isPresented: $isShowingView) {
            CreateEntryView(isOn: $isShowingView)
                .environmentObject(entrySections)
        }
        .onAppear {
            print("wow")
            entrySections.loadEntrySections()
        }

    }
    
  
    
    var statisticsView: some View {
        HStack(spacing: 20) {
            reflectionView
            Spacer()
            checkView
            Spacer()
            photoView
        }
        .foregroundColor(.black)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .padding(15)
        .background(.linearGradient(colors: [.white, .white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .white.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: .white.opacity(0.3), radius: 2, x: 0, y: 1)
        
    }
    var reflectionView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("\(fetchStats().0)")
                .customFont(.title2, fontSize: 24)
            Text("reflections")
                .customFont(.caption, fontSize: 12)
                .opacity(0.7)
        }
    }
    var checkView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("\(fetchStats().1)") //not finished (stats not finished)
                .customFont(.title2, fontSize: 24)
            Text("check-ins")
                .customFont(.caption, fontSize: 12)
                .opacity(0.7)
        }
    }
    var photoView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("\(fetchStats().2)")
                .customFont(.title2, fontSize: 24)
            Text("photos")
                .customFont(.caption, fontSize: 12)
                .opacity(0.7)
        }
    }
    func fetchStats() -> (Int, Int, Int, Int) {
        var journal = 0
        var mood = 0
        var photo = 0
        
        
        for section in entrySections.entrySections {
            journal += section.journal
            mood += section.mood
            photo += section.photos
        }
        let total = journal + mood + photo
        
        return (journal, mood, photo, total)
    }
    var createView: some View {
        
        HStack() {
            Image(systemName: "plus.circle")
                .frame(height: 30)
                .scaleEffect(1.5)
                .offset(CGSize(width: -15, height: 0))

            createTextView
                .offset(CGSize(width: -25, height: 0))
            Spacer()
            Image(systemName: "chevron.right")
                .frame(height: 30)
                .scaleEffect(1.5)
                .offset(CGSize(width: 15, height: 0))

        }
        .foregroundColor(.white)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .padding(15)
        .background(.linearGradient(colors: [.indigo, .indigo.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
        .shadow(color: .indigo.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: .indigo.opacity(0.3), radius: 2, x: 0, y: 1)
        
        .onTapGesture {
            withAnimation {
                isShowingView.toggle()
            }
        }
    }
    var createTextView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Create an entry")
                .customFont(.subheadline2, fontSize: 15)
            Text("Keep track of how you feel")
                .customFont(.subheadline, fontSize: 15)
                .opacity(0.7)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
    
    }
    
    func calculateHeight(mood: Int, journal: Int, photo: Int) -> CGFloat {
        let headerHeight: CGFloat = 50
        let moodItemHeight: CGFloat = 180
        let journalItemHeight: CGFloat = 280
        let photoItemHeight: CGFloat = 320

        let verticalPadding: CGFloat = 20

        let contentHeight = (CGFloat(mood) * moodItemHeight) + (CGFloat(journal) * journalItemHeight) + (CGFloat(photo) * photoItemHeight)
        
        let totalHeight = headerHeight + contentHeight + 2 * verticalPadding

        return totalHeight
    }
    
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        var savedEntries = SavedEntries()
        savedEntries.entrySections = []
        return JournalView(entrySections: savedEntries)
       // JournalView()
    }
}
//refresh
