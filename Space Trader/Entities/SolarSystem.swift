//
//  SolarSystem.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class SolarSystem: Hashable {
    
    public private(set) var name: String
    public private(set) var planets: Set<Planet>
    public private(set) var sun: Sun = Sun(size: nil)
    
    public var hashValue: Int {
        get {
            return name.hashValue + planets.hashValue
        }
    }
    
    static func == (lhs: SolarSystem, rhs: SolarSystem) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public init(name: String! = "", systems: Set<SolarSystem>! = Set<SolarSystem>()) {
        self.planets = Set()
        self.name = name
    }
}
