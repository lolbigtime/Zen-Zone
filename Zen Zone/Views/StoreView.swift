//
//  StoreView.swift
//  Zen Zone
//
//  Created by Andruw Lin on 9/11/23.
//

import SwiftUI
import Foundation

struct StoreView: View {
    @State var item: StoreItems
    @AppStorage("Points") private var points = UserDefaults.standard.integer(forKey: "Points")
    @State private var Bought = false
    var streaks = items.filter { $0.type == "streak" }
    var cosmetics = items.filter { $0.type == "cosmetic" }


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
            Text("Shop")
                .customFont(.title3, fontSize: 50)
                .padding(.horizontal, 20)
            Divider()
                .frame(height: 6)
                .background(
                            RoundedRectangle(cornerRadius: 7)
                            .foregroundColor(Color.blue)
                    )
                .padding(.horizontal, 50)
            ZStack {
                        RoundedRectangle(cornerRadius: 10) // Add corner radius for rounded edges
                            .fill(Color.gray)
                            .frame(width: 300, height: 200) // Adjust the size as needed
                            
                        Text("Insert Shop Related Image Here")
                            .foregroundColor(Color.white)
                            .font(.headline)
                    }
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Divider()
                        .frame(height: 6)
                        .background(
                                    RoundedRectangle(cornerRadius: 7)
                                    .foregroundColor(Color.blue)
                            )
                        .padding(.horizontal, 50)
                    Text("Streaks")
                        .customFont(.title3, fontSize: 40)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    ForEach(streaks, id: \.id) { item in
                        SCard(items: items[0])}
                    .padding(2)
                    .padding(.bottom, 10)
                    Divider()
                        .frame(height: 6)
                        .background(
                                    RoundedRectangle(cornerRadius: 7)
                                    .foregroundColor(Color.blue)
                            )
                        .padding(.horizontal, 50)
                    Text("Cosmetics")
                        .customFont(.title3, fontSize: 40)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 20)
                    HStack {
                        ForEach(cosmetics.prefix(2), id: \.id) { item in
                            TCard(items: items[0])
                        }
                        .padding(9)
                    }
                }
            }
        }
    .padding(.top, 10)
    .padding(.bottom, 20)
    .foregroundColor(.blue)
    }
    
}


struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(item: items[0])
    }
}




