//
//  MCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/12/23.
//

import SwiftUI
import ChatGPTSwift

struct MCard: View {
    @State var maxWidth: CGFloat
    @State var message: Message
    
    func finishedLoading() {
        let api = ChatGPTAPI(apiKey: "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")
        Task {
            do {
                
                let response = try await api.sendMessage(text: message.text, model: "gpt-3.5-turbo", systemText: "In this conversation, please ensure that the chatbot: 1. Empathizes with the user's feelings and concerns. 2. Offers supportive and non-judgmental responses. 3. Provides information on common mental health issues and coping strategies. 4. Encourages the user to seek professional help if their situation appears to be a crisis and give the proper contact information. 5. Remains respectful of privacy and doesn't request personal or sensitive information from the user. 5. Be concise and dont make messages longer than 3 sentences. Thank you for helping users with their mental health concerns while maintaining a compassionate and ethical approach.", temperature: 0.5)
                
                message.text = response
                message.loading = false


            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    var body: some View {
        VStack(alignment: message.user ? .trailing : .leading) {
            HStack {
                if message.loading == true {
                    HStack {
                        DotLoadingView()
                            .padding(12)
                            .background(Color.green)
                            .cornerRadius(20, corners: [.topLeft, .topRight, .bottomRight])
                            .onAppear { finishedLoading() }
                    }
                    .frame(width: 100, height: 50)

                    
                    
                } else {
                    Text(message.text)
                        .padding(12)
                        .background(message.user == true ? Color.blue : Color.green)
                        .foregroundColor(.white)
                        //.fixedSize()
                        .cornerRadius(20, corners: message.user ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])


                }
            }
            .frame(maxWidth: maxWidth, alignment: message.user ? .trailing : .leading)
            
        }
        .frame(maxWidth: .infinity, alignment: message.user ? .trailing : .leading)
        .padding(message.user ? .trailing : .leading)
        
        
    }
}

#Preview {
    MCard(maxWidth: 300, message: Message(text: "dijdnsidnsijdsijndijdnsidnsijdsijndijdnsidnsijdsijndijdnsidnsijdsijndijdnsidnsijdsijn", user: false, loading: true))
}
