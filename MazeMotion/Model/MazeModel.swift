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
    @Published var currentBallPosition: CGPoint = .zero
    
    private(set) var currentMaze: [[Int]] = [[]]
    private (set)var currentLevel: Level = .easy
    private (set) var numberOfRows: Int = .zero
    private (set) var numberOfColumns: Int = .zero
    private (set) var cellSize: Int = 30
    private (set) var currentMazeIndex: Int = .zero
    
    var mazeSize: CGSize {
        return .init(width: numberOfColumns * cellSize, height: numberOfRows * cellSize)
    }
    
    init(_ level: Int = .zero) {
        currentLevel = Level(from: level)
        currentMaze = getCurrentMaze()
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
        currentBallPosition = newPosition
    }
    
    func mazesForLevel() -> Int {
        switch currentLevel {
            case .easy:
                return EasyMaze().mazes.count
            case .medium:
                return MediumMaze().mazes.count
            case .hard:
                return HardMaze().mazes.count
        }
    }
    
    // MARK: PRIVATE

    private func getCurrentMaze() -> [[Int]] {
        switch currentLevel {
            case .easy:
                return getCurrentMaze(of: EasyMaze())
            case .medium:
                return getCurrentMaze(of: MediumMaze())
            case .hard:
                return getCurrentMaze(of: HardMaze())
        }
    }
    
    private func getCurrentMaze(of level: MazeLevel) -> [[Int]] {
        if currentMazeIndex >= 0 && currentMazeIndex < level.mazes.count {
            return level.mazes[currentMazeIndex]
        }
        return [[]]
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
