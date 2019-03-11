//
//  SpaceBody.swift
//  Space Trader
//
//  Created by Max Zuo on 3/8/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

protocol SpaceBody {
    var radius: Float! { get }
    var name: String! { get }
    var pos: Coordinate! { get }
    
    func overlap(location: Coordinate, body: SpaceBody) -> Bool
}

extension SpaceBody {
    func overlap(location: Coordinate, body: SpaceBody) -> Bool {
        let bodyRad = body.radius!
        let bodyPos = body.pos!
        
        let distance: Float = (powf((bodyPos.x - location.x), 2)
            + powf((bodyPos.y - location.y), 2)).squareRoot()
        
        if distance < bodyRad + radius {
            return true
        }
        return false
    }
}
