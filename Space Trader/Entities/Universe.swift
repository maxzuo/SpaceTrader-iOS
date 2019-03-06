//
//  Universe.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class Universe {
    
    public private(set) var solarSystems: Set<SolarSystem>
    public static var BOUNDS: (x: Float, y: Float) = (150, 100)
    
    public init() {
        self.solarSystems = Set()
        initializeSolarSystems()
    }
    
    private func initializeSolarSystems() {
    
    }
}
