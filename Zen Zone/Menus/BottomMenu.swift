//
//  BottomMenu.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/4/23.
//

import SwiftUI

struct BottomMenu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Avatar")
                    .customFont(.title2, fontSize: 20)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("Change Avatar")
                    .customFont(.title2, fontSize: 16)
                Text("Upload a PNG or JPG. Images should be in a 1:1 format")
                    .customFont(.body, fontSize: 12)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("Switch Banner")
                    .customFont(.title2, fontSize: 16)
                Text("Choose a banner to decorate your avatar with!")
                    .customFont(.body, fontSize: 12)
            }
            
            Spacer()
                .frame(height: 110)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color("Background 2"))
        .cornerRadius(20 )
        .transition(.move(edge: .bottom))

    }
}

#Preview {
    BottomMenu()
}
