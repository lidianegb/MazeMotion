//
//  MazeMotionView.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MazeMotionViewModel()
    @ObservedObject var motionManager = MotionManager()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                VStack {
                    if !showAnimations() {
                        Text(viewModel.getTitle())
                            .font(.largeTitle)
                            .modifier(GlowBorder())
                    }
                    if viewModel.showCheckAnimation {
                        CheckMarkAnimation()
                    } else if viewModel.showLevelAnimation {
                        LevelAnimation(level: viewModel.currentLevel + 1)
                    } else if !viewModel.finishGame {
                        MazeView(mazeModel: viewModel.mazeModel)
                            .onReceive(motionManager.$position) { _ in
                                viewModel.checkNewPosition(motionManager.position)
                            }
                    }
                    if !showAnimations() {
                        Button("Reiniciar") {
                            viewModel.resetGame()
                            showLevelAnimation()
                        }
                        .modifier(ButtonGame())
                        .padding(.top, 48)
                    }
                }
            }
            .onAppear {
               showLevelAnimation()
            }
        }
    }
    
    private func showLevelAnimation() {
        viewModel.showLevelAnimation.toggle()
        Task { @MainActor in
            try await Task.sleep(for: .seconds(1))
            self.viewModel.showLevelAnimation.toggle()
        }
    }

    private func showAnimations() -> Bool {
        return viewModel.showCheckAnimation ||  viewModel.showLevelAnimation
    }
}

#Preview {
    ContentView()
}
