//
//  SideMenu.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/9/23.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @ObservedObject var userModel: UserModel
    @AppStorage("selectedTab") var selectedTab: Tab = .home

    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: userModel.profileImage ?? UIImage(named: "testimage")!)
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text(userModel.username ?? "")
                        .font(.headline)
                    Text(Date.now.formatted())
                        .font(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            
            Text("BROWSE")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(tabItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                    
                    MenuRow(item: item, selectedMenu: $selectedTab)
                }
            }
            .padding(8)
            
           
            Spacer()
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color("Background 2"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: menuSelect
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favorites),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
]

enum menuSelect: String {
    case home
    case search
    case favorites
    case help
}
