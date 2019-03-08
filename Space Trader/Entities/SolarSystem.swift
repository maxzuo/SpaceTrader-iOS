//
//  SolarSystem.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class SolarSystem: Hashable, SpaceBody {
    
    public private(set) var name: String
    public private(set) var planets: Set<Planet>
    public private(set) var sun: Sun = Sun(size: nil)
    public private(set) var pos: Coordinate = (0, 0)
    public private(set) var radius: Float = 0
    
    public var hashValue: Int {
        get {
            return name.hashValue + planets.hashValue
        }
    }
    
    static func == (lhs: SolarSystem, rhs: SolarSystem) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public init(name: String! = "", systems: Set<SolarSystem>) {
        self.planets = Set()
        self.name = name
        self.pos = setPos(systems: systems)
        instantiatePlanets()
    }
    
    public init(name: String! = "", location: Coordinate, radius: Float) {
        self.planets = Set()
        self.name = name
        self.pos = location
        self.radius = radius
        instantiatePlanets()
    }
    
    private func instantiatePlanets() {
        
    }
    
    
    
    private func setPos(systems: Set<SolarSystem>) -> Coordinate {
        var radius = Float.random(in: 2...10)
        
        var pos: Coordinate?
        while (pos == nil) {
            let temp = (x: Float.random(in: 0...Universe.BOUNDS.x), y: Float.random(in: 0...Universe.BOUNDS.y))
            var overlapping: Bool = false
            for system in systems {
                if system.overlap(pos: temp, body: self) {
                    overlapping = true
                }
            }
            if !overlapping {
                pos = temp
            } else if radius > 1 {
                radius *= 0.9
            }
        }
        
        self.radius = radius
        if let position = pos {
            return position
        }
        return (0, 0)
    }
}

