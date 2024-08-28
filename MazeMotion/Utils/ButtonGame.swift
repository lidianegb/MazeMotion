//
//  ButtonGame.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 28/08/24.
//

import SwiftUI

struct ButtonGame: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .fontWeight(.heavy)
            .background(Color(CGColor(red: 0.94, green: 0.32, blue: 0.26, alpha: 1)))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

#Preview {
    Button {
        
    } label: {
        Text("Iniciar")
    }
    .modifier(ButtonGame())
}
