//
//  GlowBorder.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 28/08/24.
//

import SwiftUI

struct GlowBorder: ViewModifier {
    var color: Color = .white
    var lineWidth: Int = 3
    
    func body(content: Content) -> some View {
        applyShadow(content: AnyView(content), lineWidth: lineWidth)
    }
    
    func applyShadow(content: AnyView, lineWidth: Int) -> AnyView {
        if lineWidth == 0 {
            return content
        } else {
            return applyShadow(content: AnyView(content.shadow(color: color, radius: 1)), lineWidth: lineWidth - 1)
        }
    }
}

#Preview {
    Text("exemplo")
        .modifier(GlowBorder(color: .blue, lineWidth: 1))
}
