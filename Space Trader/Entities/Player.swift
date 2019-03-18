//
//  Player.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class Player {
    
    public private(set) var name: String
    public private(set) var pilotPts: Int
    public private(set) var traderPts: Int
    public private(set) var engineerPts: Int
    public private(set) var fighterPts: Int
    
    private static let STARTING_CREDITS: Int = 1000
    
    public private(set) var ship: Ship
    
    public private(set) var inventory: [Good: Int]
    
    public init() {
        
    }
}
