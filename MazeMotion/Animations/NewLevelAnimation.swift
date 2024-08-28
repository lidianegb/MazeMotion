//
//  NewLevelAnimation.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 15/08/24.
//

import SwiftUI

struct LevelAnimation: View {
    var level: Int
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Nível \(level)")
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .foregroundStyle(.indigo)
                    .modifier(GlowBorder(color: .white, lineWidth: 3))
                    .frame(width: 350, height: 50, alignment: .center)
                    .scaleEffect(animate ? 1.5 : 0.5, anchor: .center)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5), {
                            animate.toggle()
                        })
                    }
            }
        }
    }
}
#Preview {
    LevelAnimation(level: 1)
}
