//
//  Universe.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

typealias Coordinate = (x: Float, y: Float)

class Universe {
    
    public private(set) var solarSystems: Set<SolarSystem>
    public static var BOUNDS: Coordinate = (150, 100)
    public static var currentPlanet: Planet?
    
    public init() {
        self.solarSystems = Set()
        initializeSolarSystems()
    }
    
    private func initializeSolarSystems() {
//        Log.d("initialization", "Initializing solar systems");
//        double random = Math.random() * 5 + 10;
//        Log.d("initialization", String.valueOf(random));
//        for (int i = 0; i < (int) random; i++) {
//            Log.d("initialization", String.format("making solarsystem:\t%d", solarSystems.size()));
//            solarSystems.add(new SolarSystem(String.format("%d", i), this.getSolarSystems()));
//        }
        let size = Int.random(in: 10...15)
        for i in 1...size {
            let system = SolarSystem(name: String(i), systems: solarSystems)
            solarSystems.insert(system)
        }
    }
}
