//
//  Good.swift
//  Space Trader
//
//  Created by Max Zuo on 3/18/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

public class Good: Hashable {
    
    public static let WATER: Good = Good(mtlp: 0, mtlu: 0, ttp: 2, basePrice: 30, ipl: 3, variance: 4, ie: Event.drought, cheapCond: ResourceLevel.LOTSOFWATER, expensiveCond: ResourceLevel.DESERT, mtl: 30, mth: 50)
    public static let FURS: Good = Good(mtlp: 0, mtlu: 0, ttp: 0, basePrice: 250, ipl: 10, variance: 10, ie: Event.cold, cheapCond: ResourceLevel.RICHFAUNA, expensiveCond: ResourceLevel.LIFELESS, mtl: 230, mth: 280)
    public static let FOOD: Good = Good(mtlp: 1, mtlu: 0, ttp: 1, basePrice: 100, ipl: 5, variance: 5, ie: Event.cropfail, cheapCond: ResourceLevel.RICHSOIL, expensiveCond: ResourceLevel.POORSOIL, mtl: 90, mth: 160)
    public static let ORE: Good = Good(mtlp: 2, mtlu: 2, ttp: 3, basePrice: 350, ipl: 20, variance: 10, ie: Event.war, cheapCond: ResourceLevel.WARLIKE, expensiveCond: nil, mtl: 350, mth: 420)
    public static let GAMES: Good = Good(mtlp: 3, mtlu: 1, ttp: 6, basePrice: 250, ipl: -10, variance: 5, ie: Event.boredom, cheapCond: ResourceLevel.ARTISTIC, expensiveCond: nil, mtl: 160, mth: 270)
    public static let FIREARMS: Good = Good(mtlp: 3, mtlu: 1, ttp: 5, basePrice: 1250, ipl: -75, variance: 100, ie: Event.war, cheapCond: ResourceLevel.WARLIKE, expensiveCond: nil, mtl: 600, mth: 1100)
    public static let MEDICINE: Good = Good(mtlp: 4, mtlu: 1, ttp: 6, basePrice: 650, ipl: -20, variance: 10, ie: Event.plague, cheapCond: ResourceLevel.LOTSOFHERBS, expensiveCond: nil, mtl: 400, mth: 700)
    public static let MACHINES: Good = Good(mtlp: 4, mtlu: 3, ttp: 5, basePrice: 900, ipl: -30, variance: 5, ie: Event.lackOfWorkers, cheapCond: nil, expensiveCond: nil, mtl: 600, mth: 800)
    public static let NARCOTICS: Good = Good(mtlp: 5, mtlu: 0, ttp: 5, basePrice: 3500, ipl: -125, variance: 150, ie: Event.boredom, cheapCond: ResourceLevel.WEIRDMUSHROOMS, expensiveCond: nil, mtl: 2000, mth: 3000)
    public static let ROBOTS: Good = Good(mtlp: 6, mtlu: 4, ttp: 7, basePrice: 5000, ipl: -150, variance: 100, ie: Event.lackOfWorkers, cheapCond: nil, expensiveCond: nil, mtl: 3500, mth: 5000)
    
    
    
    public let mtlp: Int
    public let mtlu: Int
    public let ttp: Int
    public let basePrice: Int
    public let ipl: Int
    public let variance: Int
    public let ie: Event
    public let cheapCond: ResourceLevel?
    public let expensiveCond: ResourceLevel?
    public let mtl: Int
    public let mth: Int
    
    public var hashValue: Int {
        get {
            return mtlp + mtlu + ttp + basePrice + ipl + variance + mtl + mth
        }
    }
    
    public static func == (lhs: Good, rhs: Good) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    private init(mtlp: Int, mtlu: Int, ttp: Int, basePrice: Int, ipl: Int, variance: Int,
                 ie: Event, cheapCond: ResourceLevel?, expensiveCond: ResourceLevel?, mtl: Int, mth: Int) {
        self.mtlp = mtlp
        self.mtlu = mtlu
        self.ttp = ttp
        self.basePrice = basePrice
        self.ipl = ipl
        self.variance = variance
        self.ie = ie
        self.cheapCond = cheapCond
        self.expensiveCond = expensiveCond
        self.mtl = mtl
        self.mth = mth
    }
    
    public func calculatePrice(tech: TechLevel) -> Int {
        let price = basePrice + ipl * (TECHLEVELS.firstIndex(of: tech)! - mtlp)
        let priceVar = (Float(basePrice) * 0.01 * Float(variance) * (Float.random(in: -1.0...1.0)))
        
        return price + Int(priceVar)
    }
    
    public class func values() -> [Good] {
        return [Good.WATER, Good.FURS, Good.FOOD, Good.ORE, Good.GAMES, Good.FIREARMS, Good.MEDICINE, Good.MACHINES, Good.NARCOTICS, Good.ROBOTS]
    }
}
