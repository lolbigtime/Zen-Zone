//
//  JournalView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/12/23.
//

import SwiftUI

struct JournalView: View {
    
    var statistics = Statistic(reflections: 5, checkIns: 2, images: 3)
    
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
            JCard(entry: jEntries[0])
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
            Text("\(statistics.reflections)")
                .customFont(.title2, fontSize: 24)
            Text("reflections")
                .customFont(.caption, fontSize: 12)
                .opacity(0.7)
        }
    }
    var checkView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("\(statistics.checkIns)")
                .customFont(.title2, fontSize: 24)
            Text("check-ins")
                .customFont(.caption, fontSize: 12)
                .opacity(0.7)
        }
    }
    var photoView: some View {
        VStack(alignment: .center, spacing: 4) {
            Text("\(statistics.images)")
                .customFont(.title2, fontSize: 24)
            Text("photos")
                .customFont(.caption, fontSize: 12)
                .opacity(0.7)
        }
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
        
    }
    var createTextView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Create an entry")
                .customFont(.subheadline2, fontSize: 15)
            Text("Keep track of what you feel")
                .customFont(.subheadline, fontSize: 15)
                .opacity(0.7)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
    }
    
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
