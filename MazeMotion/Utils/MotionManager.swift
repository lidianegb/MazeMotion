//
//  MotionManager.swift
//  MazeMotion
//
//  Created by Lidiane Gomes Barbosa on 09/07/24.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    @Published var position: CGPoint = .zero
    
    private var motionManager = CMMotionManager()
    private let queue = OperationQueue()
    private let updateInterval = 0.1
   
    init() {
        startMotionUpdates()
    }
    
    func startMotionUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = updateInterval
            motionManager.startDeviceMotionUpdates(to: queue) { [weak self] (data, error) in
                guard let data else { return }
                DispatchQueue.main.async {
                    self?.position = CGPoint(x: data.gravity.x, y: data.gravity.y)
                }
            }
        }
    }
}
