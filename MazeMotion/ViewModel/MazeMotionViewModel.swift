//
//  MazeMotionViewModel.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 15/08/24.
//

import SwiftUI

class MazeMotionViewModel: ObservableObject {
    @ObservedObject var mazeModel = MazeModel()
    
    var showLevelAnimation: Bool = false
    private (set) var showCheckAnimation: Bool = false
    private (set) var finishGame: Bool = false
    private (set) var currentLevel: Int = .zero
    
    private var ballPosition = CGPoint.zero
    private var currentIndex = Int.zero
    
    init() {
        self.ballPosition = mazeModel.currentBallPosition
    }
    
    let cellSize: CGFloat = 30
    
    func getTitle() -> String {
        finishGame ? "Fim!" : "Nível \(currentLevel + 1) [\(currentIndex + 1)]"
    }
    
    func checkNewPosition(_ position: CGPoint) {
        let newX = ballPosition.x + CGFloat(position.x * 10)
        let newY = ballPosition.y - CGFloat(position.y * 10)
        
        let newCellX = Int(newX / cellSize)
        let newCellY = Int(newY / cellSize)
        
        guard newCellY >= 0 && newCellX >= 0 else { return }
        
        if mazeModel.currentMaze[newCellY][newCellX] != 1 {
            updateBallPosition(newPosition: CGPoint(x: newX, y: newY))
        }
        
        if mazeModel.isExit(row: newCellY, column: newCellX) {
            nextMaze()
        }
    }
    
    func finishMaze() {
        self.mazeModel.updateCurrentMaze(level: self.currentLevel, index: self.currentIndex)
        self.resetBallPosition()
        
        Task { @MainActor in
            try await Task.sleep(for: .seconds(0.5))
            self.showLevelAnimation = false
            self.showCheckAnimation = false
        }
    }
    
    func nextMaze() {
        if currentIndex < mazeModel.mazesForLevel() - 1 {
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
                showLevelAnimation = false
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
    
    private func updateBallPosition(newPosition: CGPoint) {
        ballPosition = newPosition
        mazeModel.updateBallPosition(newPosition)
    }
}
