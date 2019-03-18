//
//  Ship.swift
//  Space Trader
//
//  Created by Max Zuo on 3/18/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

public class Ship {
    public private(set) var shipType: ShipType
    public private(set) var holdSize: Int
    public private(set) var location: Coordinate
    public private(set) var fuel: Float
    public static let STARTING_FUEL: Float = 10000000; //random number, should change it at some point?
    
    public init(shipType: ShipType) {
        self.shipType = shipType
        self.holdSize = shipType.rawValue
        self.fuel = Ship.STARTING_FUEL
        self.location = (0, 0)
    }
}
