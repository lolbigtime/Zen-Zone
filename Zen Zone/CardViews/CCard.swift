//
//  CCard.swift
//  Zen Zone
//
//  Created by Tai Wong on 3/11/23.
//

import SwiftUI

struct CCard: View {
    var option: activityOption
    @State private var isPresenting = false
    @Binding var activitySections: [ActivitySection]
    
    var body: some View {
        
        NavigationLink {
            CategoryView(category: option.section, activities: $activitySections)
        } label: {
            VStack(alignment: .center, spacing: -5) {
                option.image.resizable().aspectRatio(1, contentMode: .fill)
                    .foregroundColor(option.color.opacity(0.7))
                    .clipShape(Circle())
                    .padding()
                    .overlay {
                        Circle().stroke(option.color, lineWidth: 1)
                            .padding(10)
                    }
                    .shadow(radius: 3)
                    .frame(width: 50, height: 50)
                Text(option.section)
                    .customFont(.footnote, fontSize: 12)
            }
        }
        
        
   //     .onTapGesture {
  //          isPresenting.toggle()
     //   }
       // .sheet(isPresented: $isPresenting) {
       // }
        
    }
}

