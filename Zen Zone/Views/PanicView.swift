//
//  PanicView.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/13/23.
//

import SwiftUI

struct PanicView: View {
    let hotlines: [Hotline] = [
        Hotline(name: "Oregon Youthline", call: "877-968-8491", text: "839863", textMSG: "teen2teen"),  Hotline(name: "Portland Mental Health & Wellness", call: "503-622-8964", text: nil, textMSG: nil), Hotline(name: "Washington County Crisis Line", call: "503-291-9111", text: nil, textMSG: nil), Hotline(name: "Multnomah County Crisis Line", call: "503-988-4888", text: nil, textMSG: nil), Hotline(name: "Columbia County Crisis Line", call: "503-782-4499", text: nil, textMSG: nil), Hotline(name: "Yamhill County Crisis Line", call: "844-842-8200", text: nil, textMSG: nil), Hotline(name: "Clackamas County Crisis Line", call: "503-655-8585", text: nil, textMSG: nil),
    ]
    let hotlines2: [Hotline] = [
        Hotline(name: "Disaster Distress Helpline", call: "1-800-985-5990", text: "66746", textMSG: "TalkWithUs"), Hotline(name: "Crisis Text Line", call: nil, text: "741741", textMSG: "HOME"), Hotline(name: "National Suicide Prevention Lifeline", call: "1-800-273-8255", text: nil, textMSG: nil), Hotline(name: "National Suicide & Crisis Lifeline", call: "988", text: "988", textMSG: nil),
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("Background 2").ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("Get Help:")
                            .multilineTextAlignment(.center)
                            .customFont(.largeTitle, fontSize: 30)
                            .foregroundColor(.white)
                            .padding(.top, 40)
                        Text("Oregon Mental Health \n Resources")
                            .multilineTextAlignment(.center)
                            .customFont(.largeTitle, fontSize: 20)
                            .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text("Suicide Helplines:")
                                .customFont(.caption2, fontSize: 20)
                                .foregroundColor(.white)
                            ForEach(hotlines, id: \.name) { hotline in
                                HotlineButton(hotline: hotline)
                            }
                        }
                        .padding()
                        
                        Text("National Mental Health \n Resources")
                            .multilineTextAlignment(.center)
                            .customFont(.largeTitle, fontSize: 20)
                            .foregroundColor(.white)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Suicide Helplines:")
                                .customFont(.caption2, fontSize: 20)
                                .foregroundColor(.white)
                            ForEach(hotlines2, id: \.name) { hotline in
                                HotlineButton(hotline: hotline)
                            }
                        }
                        .padding()
                        .padding(.bottom, 20)
                        
                        Spacer()
                    }
                    .padding()
                   // .frame(width: geo.size.width, height: geo.size.height)
                }
            }
        }
        
    }
}

struct HotlineButton: View {
    let hotline: Hotline

    var body: some View {
        HStack {
            Text("\(hotline.name):")
            Spacer()
            
            if let callnum = hotline.call {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "phone")
                }
                .onTapGesture {
                    if let url = URL(string: "tel://\(callnum)") {
                        UIApplication.shared.open(url)
                    }
                }
            }
            
            if let textnum = hotline.text {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 40, height: 40)
                    Image(systemName: "message")
                }
            
                .onTapGesture {
                    if let url = URL(string: "sms:\(textnum)&body=\(hotline.textMSG?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                        UIApplication.shared.open(url)
                    }
                }
            }
            
        }
        .foregroundColor(.white)
    }
}

struct Hotline {
    let name: String
    let call: String?
    let text: String?
    let textMSG: String?
}

#Preview {
    PanicView()
}
