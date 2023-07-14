//
//  DetailedView.swift
//  Zen Zone
//
//  Created by Andruw Lin on 7/13/23.
//

import SwiftUI

struct DetailedView: View {
    var detail: activitydetails
    @State private var isPresenting = false
    var body: some View {
        VStack{
            Button("Start") {
                isPresenting.toggle()
            }
            .padding(.top, 200)
            .padding(.trailing, 0)
            .foregroundColor(.black)
            .fullScreenCover(isPresented: $isPresenting,
                             onDismiss: didDismiss) {
                VStack {
                    Text(detail.title)
                        .foregroundColor( .white)
                        .font(.bold(.largeTitle)())
                    Spacer()
                        .frame(maxHeight:30)
                    Text(detail.body)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                    Spacer()
                        .frame(maxHeight:30)
                    Text("\(detail.points) Point - \(detail.type) activity")
                        .customFont(.body, fontSize: 20)
                    Spacer()
                        .frame(maxHeight:40)
                    Text("Tap to Close")
                }
                .onTapGesture {
                    isPresenting.toggle()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .background(Color.blue)
                .ignoresSafeArea(edges: .all)
            }                    }}
    func didDismiss() {
        // Handle the dismissing action.
    }}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(detail: details[0])
    }
}
