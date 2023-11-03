//
//  ChatView.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/12/23.
//

import SwiftUI
import ChatGPTSwift

struct ChatView: View {
    @State var messageText: String = ""
    @State var messages: [Message] = [Message(text: "Hi, who are you?", user: false, loading: true)]
    @State var bottomPadding: CGFloat = 30
    @State var panic: Bool = false
    
    func createText(text: String, user: Bool, loading: Bool) {
        let message = Message(text: text, user: user, loading: loading)
        messages.append(message)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let aimessage = Message(text: text, user: false, loading: true)
            messages.append(aimessage)
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                Color("Background").ignoresSafeArea()
                VStack(spacing: 10) {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(spacing: 10) {
                                ForEach(messages.indices, id: \.self) { index in
                                    MCard(maxWidth: geo.size.width / 1.8, message: messages[index])
                                        
                                }
                                
                            }

                        }
                        .onChange(of: messages) { id in
                            // When the lastMessageId changes, scroll to the bottom of the conversation
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                    }
                    .scrollIndicators(.hidden, axes: .vertical)

                    
                    textBox
                        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                            withAnimation {
                                bottomPadding = (geo.size.height / 3) + 35
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                            withAnimation {
                                bottomPadding = 35
                            }
                        }
                        .padding(.bottom, bottomPadding)
                }
                .padding(.bottom, 20)
                
            }
        }
        .sheet(isPresented: $panic) {
            PanicView()
        }
    }
    
  
    
    var textBox: some View {
        HStack {
            TextField("", text: $messageText, prompt:
                        Text("Reply or text HELP")
                .foregroundColor(Color.white)
            )
            .bold()
            .padding()
            .background(Color("Alternate"))
            .cornerRadius(10)
            .foregroundColor(Color.white)
            .accentColor(Color.white)
            
            Button(action: {
                if messageText == "HELP" {
                    panic = true
                } else {
                    createText(text: messageText, user: true, loading: false)
                    messageText = ""
                }
                
            }) {
                ZStack {
                    Circle()
                        .fill(Color("Background 2"))
                        .frame(width: 50, height: 50)
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .disabled((messageText == "" || messageText == " ") ? true : false)

            
        }
        .padding(.horizontal)
    }
}
