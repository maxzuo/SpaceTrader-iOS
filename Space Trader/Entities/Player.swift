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
    public private(set) var credits: Int = Player.STARTING_CREDITS
    
    public private(set) var ship: Ship
    
    public private(set) var inventory: [Good: Int] = [Good: Int]()
    public private(set) var inventorySize: Int = 0
    
    public init(name: String, pilotPts: Int, traderPts: Int, engineerPts: Int, fighterPts: Int) {
        self.name = name
        self.traderPts = traderPts
        self.pilotPts = pilotPts
        self.engineerPts = engineerPts
        self.fighterPts = fighterPts
        for good in Good.values() {
            inventory[good] = 0
        }
        self.ship = Ship(shipType: ShipType.GNAT)
    }
    
    public func acquireShip(newShip: ShipType) -> Void {
        if (inventorySize > newShip.rawValue) {
            print("YO YO YO THAT'S NOT ALLOWED BRO HEME")
            return
        }
        self.ship = Ship(shipType: newShip)
    }
    
    public func addGood(good: Good, amount: Int) {
        
        //Bad practice to put "!", but for sake of this project,
        // it is guaranteed that Int? is Int
        inventory[good] = inventory[good]! + amount
        inventorySize += amount
    }
    
    public func removeGood(good: Good, amount: Int) {
        inventory[good] = inventory[good]! - amount
        self.inventorySize -= amount
    }
}
