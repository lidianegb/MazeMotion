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
                    if !viewModel.showCheckAnimation && !viewModel.showLevelAnimation {
                        Text(viewModel.getTitle())
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                    if viewModel.showCheckAnimation || viewModel.showLevelAnimation {
                        CheckMarkAnimation()
                    } else if !viewModel.finishGame {
                        ZStack {
                            MazeView(mazeModel: viewModel.mazeModel)
                                .onReceive(motionManager.$position) { _ in
                                    viewModel.updateBallPosition(motionManager.position)
                                }
                        }
                    }
                }
                if viewModel.finishGame {
                    Button("Jogar novamente") {
                        viewModel.resetGame()
                    }
                    .padding(.top)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
