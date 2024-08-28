//
//  MazeView.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import SwiftUI

struct MazeView: View {
    @ObservedObject var mazeModel: MazeModel
    
    private var wallSize: CGFloat
    private var ballSize: CGFloat
    private let mazeSize: CGSize
    
    init(mazeModel: MazeModel) {
        self.mazeModel = mazeModel
        self.mazeSize = mazeModel.mazeSize
        self.ballSize = CGFloat(mazeModel.cellSize)
        self.wallSize = CGFloat(mazeModel.cellSize) / 2
    }
    
    var body: some View {
        ZStack {
            ForEach(.zero..<mazeModel.numberOfRows, id: \.self) { row in
                ForEach(.zero..<mazeModel.numberOfColumns, id: \.self) { column in
                    if mazeModel.isWall(row: row, column: column) {
                        Circle()
                            .frame(width: wallSize, height: wallSize)
                            .position(calculatePosition(row: row, column: column))
                            .foregroundColor(.indigo)
                    } else if mazeModel.isBall(row: row, column: column) {
                        Image("ball-icon")
                            .resizable()
                            .frame(width: ballSize, height: ballSize)
                            .position(mazeModel.currentBallPosition)
                    }
                }
            }
        }.frame(width: mazeSize.width, height: mazeSize.height)
    }
    
    private func calculatePosition(row: Int, column: Int) -> CGPoint {
        return .init(x: CGFloat(column) * ballSize + ballSize / 2,
                     y: CGFloat(row) * ballSize + ballSize / 2)
    }
}

#Preview {
    return MazeView(mazeModel: MazeModel())
}
