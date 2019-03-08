//
//  SpaceBody.swift
//  Space Trader
//
//  Created by Max Zuo on 3/8/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

protocol SpaceBody {
    var radius: Float { get }
    var name: String { get }
    var pos: Coordinate{ get }
    
    func overlap(pos: Coordinate, body: SpaceBody) -> Bool
}

extension SpaceBody {
    func overlap(pos: Coordinate, body: SpaceBody) -> Bool {
        let bodyRad = body.radius
        let bodyPos = body.pos
        
        let distance: Float = (powf((bodyPos.x - pos.x), 2)
            + powf((bodyPos.y - pos.y), 2)).squareRoot()
        
        if distance < bodyRad + radius {
            return true
        }
        return false
    }
}
