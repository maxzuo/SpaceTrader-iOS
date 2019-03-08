//
//  Planet.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation
import CoreData

class Planet: Hashable, SpaceBody {
    
    public private(set) var pos: Coordinate
    public private(set) var name: String
    public private(set) var radius: Float
    
    public private(set) var techLevel: TechLevel
    public private(set) var resourceLevel: ResourceLevel
    
    public private(set) var solarSystem: SolarSystem
    
    public var hashValue: Int {
        get {
            return name.hashValue + pos.x.hashValue + pos.y.hashValue
        }
    }
    
    public init (sunSize: Float, planets: Set<Planet>, solarSystem: SolarSystem) {
        // Get name from the list of available planet names. This was randomized on start up, so everything should be ok.
        // Removes a name from the list to ensure that AVAILABLE_PLANET_NAMES will never have anything from USED_PLANET_NAMES.
//        this.solarSystem = solarSystem;
//        name = null;
//        while (name == null) {
//            Log.d("pnames", String.valueOf(AVAILABLE_PLANET_NAMES.size()));
//            if (AVAILABLE_PLANET_NAMES.isEmpty()) {
//                throw new RuntimeException("App does not handle when AVAILABLE_PLANET_NAMES becomes empty");
//            }
//            Log.d("initialization", "making planets: inside Planet()");
//            String temp = AVAILABLE_PLANET_NAMES.pop();
//            if (!USED_PLANET_NAMES.contains(temp)) {
//                name = temp;
//                break;
//            }
//        }
        self.solarSystem = solarSystem;
        var name: String? = nil
        while (name == nil) {
            
        }
    }
    
    public init (name: String, pos: Coordinate, techLevel: TechLevel, resourceLevel: ResourceLevel, radius: Float, solarSystem: SolarSystem) {
        self.name = name
        self.pos = pos
        self.techLevel = techLevel
        self.resourceLevel = resourceLevel
        self.radius = radius
        self.solarSystem = solarSystem
    }
    

    // Hashable protocol implementation
    static func == (lhs: Planet, rhs: Planet) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}
