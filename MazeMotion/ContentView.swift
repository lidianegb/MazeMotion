//
//  ContentView.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var motionManager = MotionManager()
    @State private var ballPosition = CGPoint(x: 105, y: 15)
    @State private var currentLevel = 0
    @State private var showAnimation: Bool = false
    @State private var finishGame: Bool = false
    
    private let ballSize: CGFloat = 30
    private let mazeSize: CGFloat = 320
    private let cellSize: CGFloat = 30
    
    var body: some View {
        VStack {
            VStack {
                if !showAnimation {
                    Text(getTitle())
                        .font(.title)
                        .padding(.bottom)
                }
                if showAnimation {
                    CheckMarkAnimation()
                        .padding()
                } else if !finishGame {
                    ZStack {
                        MazeView(maze: Maze.levels[currentLevel], cellSize: cellSize, size: mazeSize)
                        Circle()
                            .frame(width: ballSize, height: ballSize)
                            .position(ballPosition)
                            .foregroundColor(.blue)
                            .onReceive(motionManager.$position) { _ in
                                updateBallPosition()
                            }
                    } .frame(width: mazeSize, height: mazeSize)
                }
            }
            
            if finishGame {
                Button("Jogar novamente") {
                    resetGame()
                }
                .padding()
            }
        }
        .padding()
    
    }
    
    func getTitle() -> String {
        finishGame ? "Fim!" : "Nível \(currentLevel + 1)"
    }
    
    func updateBallPosition() {
        let newX = ballPosition.x + CGFloat(motionManager.position.x * 10)
        let newY = ballPosition.y - CGFloat(motionManager.position.y * 10)
        
        let newCellX = Int(newX / cellSize)
        let newCellY = Int(newY / cellSize)
        
        if newCellY >= Maze.levels[currentLevel].count {
           finishLevel()
            return
        }
        guard newCellY >= 0 else { return }
        
        if Maze.levels[currentLevel][newCellY][newCellX] == 0 {
            ballPosition = CGPoint(
                x:  newX,
                y:  newY
            )
        }
    }
    
    func finishLevel() {
        showAnimation.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            nextLevel()
        }
    }
    
    func nextLevel() {
        if currentLevel < Maze.levels.count - 1 {
            currentLevel += 1
            resetBallPosition()
        } else {
            finishGame.toggle()
        }
        showAnimation.toggle()
    }
    
    func resetGame() {
        finishGame.toggle()
        currentLevel = 0
        resetBallPosition()
    }
    
    private func resetBallPosition() {
        ballPosition = CGPoint(x: 105, y: 15)
    }
}

#Preview {
    ContentView()
}
