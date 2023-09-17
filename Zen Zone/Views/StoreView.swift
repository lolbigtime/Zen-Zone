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
    var stores = items.filter { $0.type == "store" }

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
            Text("Points Shop")
                .customFont(.title3, fontSize: 40)
                .padding(.horizontal, 20)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(stores, id: \.id) { item in
                        SCard(items: items[0])}
                    .padding(20)
                    .padding(.bottom, 10)
                }
            }
        }
    .padding(.top, 10)
    .padding(.bottom, 20)
    }
    struct StoreView_Previews: PreviewProvider {
        static var previews: some View {
            StoreView(item: items[0])
        }
    }
}
