//
//  MenuRow.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/10/23.
//

import SwiftUI

struct MenuRow: View {
    var item: TabItem
    @Binding var selectedMenu: Tab
    var body: some View {
        HStack {
            item.icon.view()
                .frame(width: 32, height: 32)
                .opacity(0.6)
            Text(item.text)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.blue)
                .frame(maxWidth: selectedMenu == item.tab ? .infinity : 0)
        
        )
        .background(Color("Background 2"))
        .onTapGesture {
            try? item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                try? item.icon.setInput("active", value: false)
            }
            withAnimation {
                selectedMenu = item.tab
                /*
                switch item.text {
                case "Home":
                    pass
                case "Search":
                    pass
                case "Help":
                    pass
                case "Shop":
                    pass
                case "Journal":
                    pass
                }
                 */
            }
        }
    }
}

