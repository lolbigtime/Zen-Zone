//
//  WelcomeView.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/10/23.
//

import SwiftUI
import RiveRuntime

struct WelcomeView: View {
    @State private var isAnimated = false
    @State private var isAnimated2 = false
    @State private var isAnimated3 = false
    @State private var stage = 0
    @State private var username: String = ""
    @FocusState private var emailFieldIsFocused: Bool
    @ObservedObject var userModel: UserModel
    
    var body: some View {
        ZStack {
            Color("Background 2")
                .ignoresSafeArea()
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 30)
                
            
            GeometryReader { geo in
                if stage == 0 {
                    VStack {
                        Text("👋")
                            .customFont(.title, fontSize: 70)
                            .padding(EdgeInsets(top: 60, leading: 0, bottom: 10, trailing: 0))
                            .multilineTextAlignment(.center)

                      
                        Text("Welcome to")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .opacity(isAnimated ? 1.0 : 0.0)

                        Text("Zen Zone")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .opacity(isAnimated ? 1.0 : 0.0)

                        Text("The modern mental health app for teenagers by teenagers")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                            .opacity(isAnimated2 ? 1.0 : 0.0)

                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.1)) {
                                stage += 1
                            }
                        }) {
                            Text("Start")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(30)
                        }
                        .padding(40)
                        .opacity(isAnimated3 ? 1.0 : 0.0)

                        
                    }
                    .padding()
                    .foregroundColor(.white)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isAnimated = true
                        }
                        withAnimation(.easeInOut(duration: 1.5)) {
                            isAnimated2 = true
                        }
                        withAnimation(.easeInOut(duration: 3)) {
                            isAnimated3 = true
                        }
                    }
                } else if stage == 1 {
                    VStack {
                        Text("First,")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.top, 50)

                        Text("What's your name?")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)

                        TextField(
                            "Input your name",
                            text: $username
                        )
                        .frame(height: 60)
                        .font(.title)
                        .focused($emailFieldIsFocused)
                        .multilineTextAlignment(.center)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .border(.secondary)
                        .foregroundColor(.white)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.1)) {
                                stage += 1
                            }
                        }) {
                            Text("Next")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(username == "" ? Color.gray : Color.white)
                                .cornerRadius(30)
                        }
                        .padding(40)
                        .disabled(username == "" ? true : false)

                        
                    }
                    .padding()
                    .foregroundColor(.white)
                } else if stage == 2 {
                    VStack {
                        Text("Hi,")
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .opacity(isAnimated ? 1.0 : 0.0)
                            .padding(.top, 50)

                        Text(username)
                            .font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                            .opacity(isAnimated ? 1.0 : 0.0)

                        Text("Lets get started on your journey to mental health balance")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeOut(duration: 0.1)) {
                                stage += 1
                                userModel.username = username
                                
                            }
                        }) {
                            Text("Begin")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(username == "" ? Color.gray : Color.white)
                                .cornerRadius(30)
                        }
                        .padding(40)

                        
                    }
                    .padding()
                    .foregroundColor(.white)

                }
                
                
            }
        }
    }
}
#Preview {
    WelcomeView(userModel: UserModel())
}
