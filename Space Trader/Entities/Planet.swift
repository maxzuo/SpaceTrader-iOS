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
    
    public private(set) var pos: Coordinate! = (x: 0, y: 0)
    public private(set) var name: String! = ""
    public private(set) var radius: Float! = 0.0
    
    public private(set) var techLevel: TechLevel
    public private(set) var resourceLevel: ResourceLevel
    
    public private(set) var solarSystem: SolarSystem
    
    public static var AVAILABLE_PLANET_NAMES: Array<String> = Array()
    public static var USED_PLANET_NAMES: Set<String> = Set()
    
    // Need to add inventory
    
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
            if (Planet.AVAILABLE_PLANET_NAMES.isEmpty) {
//                return;
            }
            if let temp: String = Planet.AVAILABLE_PLANET_NAMES.popLast() {
                if (!Planet.USED_PLANET_NAMES.contains(temp)) {
                    name = temp
                    Planet.USED_PLANET_NAMES.insert(temp)
                }
            }
        }
        if let unwrapped = name {
            self.name = unwrapped
        }
        
        self.radius = Float.random(in: 1...8)
        /*
         while (location == null) {
             double x = ((rand.nextBoolean() ? -1 : 1) * (Math.random() * (SolarSystem.BOUNDS.getY() / 2 - sunSize / 2)) + sunSize/2) + SolarSystem.BOUNDS.getY() / 2;
             double y = ((rand.nextBoolean() ? -1 : 1) * (Math.random() * (SolarSystem.BOUNDS.getY() / 2 - sunSize / 2)) + sunSize/2) + SolarSystem.BOUNDS.getY() / 2;
             //            location = new Coordinate(x, y);
         
             Coordinate temp = new Coordinate(x, y);
             boolean overlapping = false;
             for (Planet planet: planets) {
                 if (overlap(temp, planet)) {
                     overlapping = true;
                     break;
                 }
             }
             if (!overlapping) this.location = temp;
                 else if (radius > 1) {
                 radius *= 0.9;      //decrease size of radius to decrease future chance of overlapping.
             }
         }
         
         
         techLevel = TechLevel.values()[(int) Math.random() * 12];
         
         resourceLevel = ResourceLevel.values()[(int) (Math.random() * 12)];
         initializeInventory();
         */
        var locationSet: Bool = false
        
        self.techLevel = TECHLEVELS[Int.random(in: 0...(TECHLEVELS.count - 1))]
        self.resourceLevel = RESOURCELEVELS[Int.random(in: 0...(RESOURCELEVELS.count - 1))]
        
        while (!locationSet) {
            
            let x: Float = ((Bool.random()) ? -1 : 1) * (Float.random(in:0...(SolarSystem.BOUNDS.x/2 - sunSize/2)) + sunSize/2) + SolarSystem.BOUNDS.x / 2
            let y: Float = ((Bool.random()) ? -1 : 1) * (Float.random(in:0...(SolarSystem.BOUNDS.y/2 - sunSize/2)) + sunSize/2) + SolarSystem.BOUNDS.y / 2
            
            let temp: Coordinate = (x: x, y: y)
            var overlapping: Bool = false
            for (_, planet) in planets.enumerated() {
                if (overlap(location: temp, body: planet) == true) {
                    overlapping = true
                    break
                }
            }
            if (!overlapping) {
                self.pos = temp
                locationSet = true
            } else {
                self.radius *= 0.9
            }
            
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
