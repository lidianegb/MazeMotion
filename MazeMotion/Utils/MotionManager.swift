//
//  MotionManager.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var position: CGPoint = .zero

    init() {
        startMotionUpdates()
    }

    func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.01
            motionManager.startDeviceMotionUpdates(to: .main) { (data, error) in
                if let data = data {
                    self.position = CGPoint(x: data.gravity.x, y: data.gravity.y)
                }
            }
        }
    }
}
