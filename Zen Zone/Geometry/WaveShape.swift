//
//  WaveShape.swift
//  Zen Zone
//
//  Created by Tai Wong on 6/21/23.
//

import SwiftUI

struct WaveShapeView: View {
    
    @Binding var progress: CGFloat
    @State var phase: CGFloat = 0.0
    
    var body: some View {
       
        GeometryReader { geometry in
            HStack {
                Spacer()
                WaterWave(progress: self.progress, phase: self.phase)
                    .fill(Color.blue)
                    .background(Color("Background 3"))
                    .clipShape(Capsule())
                    .frame(width: 200)
                    .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            self.progress = 1 - value.location.y/geometry.size.height
                    }))
                
                Spacer()
            }
        }
        .onAppear() {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.phase = .pi * 2
            }
        }
    }
}

struct WaterWave: Shape {
    let progress: CGFloat
    var applitude: CGFloat = 10
    var waveLength: CGFloat = 20
    var phase: CGFloat
    
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midWidth = width / 2
        let progressHeight = height * (1 - progress)
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, to: width + 10, by: 10) {
            let relativeX = x/waveLength
            let normalizedLength = (x - midWidth) / midWidth
            let y = progressHeight + sin(phase + relativeX) * applitude * normalizedLength
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: progressHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))


        
        return path
    }
    
    
}
