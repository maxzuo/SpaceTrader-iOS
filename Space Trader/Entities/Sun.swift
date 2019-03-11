//
//  Sun.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class Sun: SpaceBody {
    
    public private(set) var radius: Float!
    public static let MAXSIZE: Float = 15.0
    public private(set) var name: String! = String("")
    public private(set) var pos: Coordinate! = (SolarSystem.BOUNDS.x / 2, SolarSystem.BOUNDS.y / 2)
    
    public init(radius: Float! = Float.random(in: 1.0...MAXSIZE)) {
        self.radius = radius
    }
}
