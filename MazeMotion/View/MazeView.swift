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
    private var characterSize: CGFloat
    private let mazeSize: CGSize
    
    init(mazeModel: MazeModel) {
        self.mazeModel = mazeModel
        self.mazeSize = mazeModel.mazeSize
        self.characterSize = CGFloat(mazeModel.cellSize)
        self.wallSize = characterSize / 2
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ForEach(.zero..<mazeModel.numberOfRows, id: \.self) { row in
                ForEach(.zero..<mazeModel.numberOfColumns, id: \.self) { column in
                    if mazeModel.isWall(row: row, column: column) {
                        Circle()
                            .frame(width: wallSize, height: wallSize)
                            .position(calculatePosition(row: row, column: column))
                            .foregroundColor(.indigo)
                    } else if mazeModel.isBall(row: row, column: column) {
                        Image("pac")
                            .resizable()
                            .frame(width: characterSize, height: characterSize)
                            .colorInvert()
                            .position(mazeModel.currentBallPosition)
                    }
                }
            }
        }.frame(width: mazeSize.width, height: mazeSize.height)
    }
    
    private func calculatePosition(row: Int, column: Int) -> CGPoint {
        return .init(x: CGFloat(column) * characterSize + characterSize / 2,
                     y: CGFloat(row) * characterSize + characterSize / 2)
    }
}

#Preview {
    return MazeView(mazeModel: MazeModel())
}
