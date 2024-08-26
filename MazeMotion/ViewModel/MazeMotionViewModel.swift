//
//  MazeMotionViewModel.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 15/08/24.
//

import SwiftUI

class MazeMotionViewModel: ObservableObject {
    @Published var mazeModel = MazeModel()
    @Published var showCheckAnimation: Bool = false
    @Published var showLevelAnimation: Bool = false
    @Published var finishGame: Bool = false
    
    private var ballPosition = CGPoint.zero
    private var currentLevel = Int.zero
    private var currentIndex = Int.zero
    
    init() {
        self.ballPosition = mazeModel.currentBallPosition
        self.currentLevel = mazeModel.currentLevel.rawValue
        self.currentIndex = mazeModel.currentMazeIndex
    }
    
    let cellSize: CGFloat = 30
    
    func getTitle() -> String {
        finishGame ? "Fim!" : "Nível \(currentLevel + 1) [\(currentIndex + 1)]"
    }
    
    func updateBallPosition(_ position: CGPoint) {
        let newX = ballPosition.x + CGFloat(position.x * 10)
        let newY = ballPosition.y - CGFloat(position.y * 10)
        
        let newCellX = Int(newX / cellSize)
        let newCellY = Int(newY / cellSize)
        
        guard newCellY >= 0 && newCellX >= 0 else { return }
        
        if mazeModel.isExit(row: newCellY, column: newCellX) {
            nextMaze()
            return
        }
        
        if mazeModel.currentMaze[newCellY][newCellX] != 1 {
            ballPosition = CGPoint(x: newX, y: newY)
            let newPosition = CGPoint(x: Int(ballPosition.x / cellSize), y: Int(ballPosition.y /  cellSize))
            mazeModel.updateBallPosition(newPosition)
        }
    }
    
    
    func finishMaze() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.mazeModel.updateCurrentMaze(level: self.currentLevel, index: self.currentIndex)
            self.resetBallPosition()
            self.showLevelAnimation = false
            self.showCheckAnimation = false
        }
    }
    
    func nextMaze() {
        if currentIndex < mazeModel.getMazesOfLevel().count - 1 {
            currentIndex += 1
            showCheckAnimation = true
            finishMaze()
        } else {
            nextLevel()
        }
    }
    
    func nextLevel() {
        showLevelAnimation = true
        currentIndex = .zero
        switch mazeModel.currentLevel {
            case .easy, .medium:
                currentLevel += 1
                finishMaze()
            case .hard:
                finishGame = true
                
        }
    }
    
    func resetGame() {
        currentLevel = .zero
        currentIndex = .zero
        mazeModel.updateCurrentMaze(level: currentLevel, index: currentIndex)
        resetBallPosition()
        finishGame = false
        showCheckAnimation = false
        showLevelAnimation = false
    }
    
    private func resetBallPosition() {
        ballPosition = mazeModel.resetBallPosition()
    }
}
