//
//  Planet.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class Planet: Hashable {
    
    public private(set) var pos: Coordinate
    public private(set) var name: String
    
    public var hashValue: Int {
        get {
            return name.hashValue + pos.x.hashValue + pos.y.hashValue
        }
    }
    
    public init (name: String, pos: Coordinate) {
        self.name = name
        self.pos = pos
    }
    

    // Hashable protocol implementation
    static func == (lhs: Planet, rhs: Planet) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
