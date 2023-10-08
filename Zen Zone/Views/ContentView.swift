//
//  ContentView.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/9/23.
//

import SwiftUI
import RiveRuntime
import CoreData

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @StateObject var quoteModel = QuoteModel()
    @StateObject var userModel = UserModel()

    @State var isOpen = false

    var button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)

    var body: some View {
        ZStack {
            
            Color("Background 2").ignoresSafeArea()
            
            SideMenu(userModel: userModel)
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
                
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                        .safeAreaInset(edge: .bottom) {
                            Color.clear.frame(height: 80)
                        }
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 104)
                        }
                        .mask(RoundedRectangle(cornerRadius: isOpen ? 30 : 0, style: .continuous))
                        .offset(x: isOpen ? 265 : 0)
                        .scaleEffect(isOpen ? 0.9: 1)
                        .rotation3DEffect(Angle(degrees: isOpen ? 30.0 : 0), axis: (x: 0, y: -1, z: 0))
                        .ignoresSafeArea()
                case .search:
                    Text("Hello")
                case .timer:
                    JournalView()
                        .safeAreaInset(edge: .bottom) {
                            Color.clear.frame(height: 80)
                        }
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 104)
                        }
                        .mask(RoundedRectangle(cornerRadius: isOpen ? 30 : 0, style: .continuous))
                        .offset(x: isOpen ? 265 : 0)
                        .scaleEffect(isOpen ? 0.9: 1)
                        .rotation3DEffect(Angle(degrees: isOpen ? 30.0 : 0), axis: (x: 0, y: -1, z: 0))
                        .ignoresSafeArea()
                case .chat:
                    ChatView()
                        .safeAreaInset(edge: .bottom) {
                            Color.clear.frame(height: 80)
                        }
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 104)
                        }
                        .mask(RoundedRectangle(cornerRadius: isOpen ? 30 : 0, style: .continuous))
                        .offset(x: isOpen ? 265 : 0)
                        .scaleEffect(isOpen ? 0.9: 1)
                        .rotation3DEffect(Angle(degrees: isOpen ? 30.0 : 0), axis: (x: 0, y: -1, z: 0))
                        .ignoresSafeArea()
                case .user:
                    ProfileView(quoteModel: quoteModel, userModel: userModel)
                        .safeAreaInset(edge: .bottom) {
                            Color.clear.frame(height: 80)
                        }
                        .safeAreaInset(edge: .top) {
                            Color.clear.frame(height: 104)
                        }
                        .mask(RoundedRectangle(cornerRadius: isOpen ? 30 : 0, style: .continuous))
                        .offset(x: isOpen ? 265 : 0)
                        .scaleEffect(isOpen ? 0.9: 1)
                        .rotation3DEffect(Angle(degrees: isOpen ? 30.0 : 0), axis: (x: 0, y: -1, z: 0))
                        .ignoresSafeArea()
                        .environmentObject(SheetManager())
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 104)
            }
            .ignoresSafeArea()
                        
            TabBar()
                .offset(y: -24)
                
                .ignoresSafeArea()
                .offset(y: isOpen ? 300 : 0)
            
            button.view()
                .frame(width: 44, height: 44)
                .mask(Circle())
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    try? button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
                .onChange(of: isOpen) { newValue in
                    if newValue {
                        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
                    } else {
                        UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    }
                }
        }
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
