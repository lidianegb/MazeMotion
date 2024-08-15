//
//  MazeView.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import SwiftUI

struct MazeView: View {
    let maze: [[Int]]
    let cellSize: CGFloat
    let size: CGFloat
    
    var body: some View {
        ZStack {
            ForEach(.zero..<maze.count, id: \.self) { row in
                ForEach(.zero..<maze[row].count, id: \.self) { column in
                    if maze[row][column] == 1 {
                        Rectangle()
                            .frame(width: cellSize, height: cellSize)
                            .position(x: CGFloat(column) * cellSize + cellSize / 2,
                                      y: CGFloat(row) * cellSize + cellSize / 2)
                            .foregroundColor(.orange)
                    }
                }
            }
        }.frame(width: size, height: size)
    }
}

#Preview {
    return MazeView(maze: Maze.levels[0], cellSize: 30, size: 345)
}
