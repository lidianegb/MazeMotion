//
//  CheckMarkAnimation.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 11/07/24.
//

import SwiftUI
struct CheckMarkShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to:CGPoint(x: rect.minX + 15, y: rect.maxY - 50))
            path.addLine(to: CGPoint(x: rect.minX + 40, y: rect.maxY - 25))
            path.addLine(to: CGPoint(x: rect.maxX - 15, y: rect.minY + 15))
        }
    }
}
struct CheckMarkAnimation: View {
    @State private var drawAnimation: Bool = false
    var body: some View {
        VStack {
            CheckMarkShape()
                .trim(from: 0.0, to: drawAnimation ? 1 : 0)
                .stroke(Color.green, lineWidth: 10)
                .frame(width: 100, height: 100)
                .animation(.easeInOut(duration: 0.5), value: drawAnimation)
                .onAppear {
                    drawAnimation = true
                }
        }
    }
}
#Preview {
    CheckMarkAnimation()
}
