//
//  StoreView.swift
//  Zen Zone
//
//  Rewritten by Tai Wong 10/23/22
//
//

import SwiftUI

struct StoreView: View {
    @AppStorage("Points") private var points = UserDefaults.standard.integer(forKey: "Points")
    var manager = StoreManager.shared

    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                content
            }
        }
        
    }
    var content: some View {
        VStack{
            HStack {
                Spacer()
                Text("Drops: \(points)")
                    .customFont(.title2, fontSize: 12)
                    .onAppear {
                        points = UserDefaults.standard.integer(forKey: "Points")
                    }
                Image(systemName: "drop.halffull")

            }
            .padding(.horizontal, 10)
            Text("Store")
                .customFont(.largeTitle, fontSize: 34)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            Text("Banners:")
                .customFont(.title, fontSize: 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            VStack(spacing: 0) {
                ForEach(manager.bannerItems, id: \.id) { item in
                    SCard(item: item)
                }
            }
            .padding(.horizontal, 10)
            
            Text("Borders:")
                .customFont(.title, fontSize: 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(manager.borderItems, id: \.id) { item in
                        BCard(item: item)
                            
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 10)
            
            Text("Music:")
                .customFont(.title, fontSize: 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(manager.musicItems, id: \.id) { item in
                        UCard(item: item)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 10)

            Spacer()
                .frame(height: 80)
        }
    }
}


struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}




