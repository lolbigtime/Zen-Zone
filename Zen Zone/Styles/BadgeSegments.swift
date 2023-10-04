//
//  BadgeSegments.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/3/23.
//

import SwiftUI

struct SquareAndTriangle: Shape {
    var cornerRadius = 20

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = min(rect.width, rect.height)
        
        // Define the size and position of the square
        let squareSize = CGSize(width: width, height: width)
        let squareRect = CGRect(origin: CGPoint(x: (rect.width - squareSize.width) / 2, y: (rect.height - squareSize.height) / 2), size: squareSize)
        
        // Create the square with rounded corners
        path.addRoundedRect(in: squareRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        // Define the size and position of the triangle
        let triangleSize = CGSize(width: width * 1.5, height: width / 2)
        let triangleRect = CGRect(origin: CGPoint(x: (rect.width - triangleSize.width) / 2, y: (rect.height + squareSize.height) / 2), size: triangleSize)
        
        // Create the triangle with rounded corners
        path.move(to: CGPoint(x: triangleRect.minX, y: triangleRect.minY))
        path.addLine(to: CGPoint(x: triangleRect.midX, y: triangleRect.maxY))
        path.addLine(to: CGPoint(x: triangleRect.maxX, y: triangleRect.minY))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    BadgeView()
}
