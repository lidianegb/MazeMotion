//
//  MazeMatrix.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 15/08/24.
//

import Foundation

struct EasyMaze {
    static var mazes = [
        [
            [1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1],
            [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1]
        ],
        [
            [1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1],
            [1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1],
            [1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1],
            [1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1],
            [1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1]
        ],
        [
            [1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1],
            [1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1],
            [1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1],
            [1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1]
        ]
    ]
}

struct MediumMaze {
    static var mazes = [
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1],
            [1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1],
            [1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
            [1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1],
            [1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
            [1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1]
        ],
        [
            [1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1],
            [1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
            [1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1],
            [1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1],
            [1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1],
            [1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1]
        ],
        [
            [1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1],
            [1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1],
            [1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
            [1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1],
            [1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1]
        ]
    ]
}

struct HardMaze {
    static var mazes = [
        [
            [1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1],
            [1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1],
            [1, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1],
            [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1],
            [1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1],
            [1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1],
            [1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1],
            [1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        ],
        [
            [1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1],
            [1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1],
            [1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1],
            [1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
            [1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1],
            [1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1],
            [1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1],
            [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
            [1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1],
            [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1]
        ],
        [
            [1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1],
            [1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1],
            [1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1],
            [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
            [1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1],
            [1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1],
            [1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1],
            [1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1],
            [1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1],
            [1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1]
        ]
    ]
}
