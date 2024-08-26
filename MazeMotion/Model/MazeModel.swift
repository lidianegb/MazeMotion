//
//  MazeModel.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import Foundation

enum Level: Int {
    case easy = 0
    case medium
    case hard
    
    init(from rawValue: Int) {
        self = Level(rawValue: rawValue) ?? .easy
    }
}

class MazeModel: ObservableObject {
    @Published var currentLevel: Level = .easy
    @Published var currentMazeIndex: Int = .zero
    @Published var currentMaze: [[Int]] = [[]]
    @Published var currentBallPosition: CGPoint = .zero
    
    var numberOfRows: Int = .zero
    var numberOfColumns: Int = .zero
    var cellSize: Int = 30
    var mazeSize: CGSize {
        return .init(width: numberOfColumns * cellSize, height: numberOfRows * cellSize)
    }
    
    init(_ level: Int = .zero) {
        currentMaze = getCurrentMaze()
        currentLevel = Level(from: level)
        currentBallPosition = getBallPosition()
        numberOfRows = currentMaze.count
        numberOfColumns = currentMaze[.zero].count
    }
    
    // MARK: PUBLIC
    
    func isWall(row: Int, column: Int) -> Bool {
        return currentMaze[row][column] == 1
    }
    
    func isBall(row: Int, column: Int) -> Bool {
        return currentMaze[row][column] == 2
    }
    
    func isExit(row: Int, column: Int) -> Bool {
        return currentMaze[row][column] == 3
    }
    
    func updateCurrentMaze(level: Int, index: Int) {
        currentMazeIndex = index
        currentLevel = Level(from: level)
        currentMaze = getCurrentMaze()
    }
    
    func resetBallPosition() -> CGPoint {
        currentBallPosition = getBallPosition()
        return currentBallPosition
    }
    
    func updateBallPosition(_ newPosition: CGPoint) {
        currentBallPosition = .init(x: newPosition.x * 30 + 30 / 2,
                             y: newPosition.y * 30 + 30 / 2)
    }
    
    func getMazesOfLevel() -> [[[Int]]] {
        switch currentLevel {
            case .easy:
                return EasyMaze.mazes
            case .medium:
                return MediumMaze.mazes
            case .hard:
                return HardMaze.mazes
        }
    }
    
    // MARK: PRIVATE
    
    private func getCurrentMaze(_ mazes: [[[Int]]]) -> [[Int]] {
        if currentMazeIndex >= 0 && currentMazeIndex < mazes.count {
            return mazes[currentMazeIndex]
        }
        return [[]]
    }
    
    private func getExitPosition() -> CGPoint {
        var exitPosition: CGPoint = .zero
        for row in 0..<currentMaze.count {
            for column in 0..<currentMaze[row].count {
                if currentMaze[row][column] == 3 {
                    exitPosition = .init(x: CGFloat(column) * 30 + 30 / 2,
                                            y: CGFloat(row) * 30 + 30 / 2)
                }
            }
        }
        return exitPosition
    }
    
    private func getCurrentMaze() -> [[Int]] {
        switch currentLevel {
            case .easy:
                return getCurrentMaze(EasyMaze.mazes)
            case .medium:
                return getCurrentMaze(MediumMaze.mazes)
            case .hard:
                return getCurrentMaze(HardMaze.mazes)
        }
    }
    
    private func getBallPosition() -> CGPoint {
        var position: CGPoint = .zero
        for row in 0..<currentMaze.count {
            for column in 0..<currentMaze[row].count {
                if currentMaze[row][column] == 2 {
                    position = .init(x: CGFloat(column) * 30 + 30 / 2,
                                            y: CGFloat(row) * 30 + 30 / 2)
                }
            }
        }
        return position
    }
}
