//
//  MCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 9/12/23.
//

import SwiftUI

struct MCard: View {
    @State var maxWidth: CGFloat
    @State var message: Message
    
    func finishedLoading() {
        //let animation = Animation.easeInOut(duration: 0.4)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           // withAnimation(animation) {
            message.loading.toggle()
           // }
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
