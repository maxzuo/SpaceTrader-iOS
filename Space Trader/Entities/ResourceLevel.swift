//
//  ResourceLevel.swift
//  Space Trader
//
//  Created by Zhaohui Li on 3/8/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

public enum ResourceLevel: Int {
    case NOSPECIALRESOURCES = 0
    case MINERALRICH = 1
    case MINERALPOOR = 2
    case DESERT = 3
    case LOTSOFWATER = 4
    case RICHSOIL = 5
    case POORSOIL = 6
    case RICHFAUNA = 7
    case LIFELESS = 8
    case WEIRDMUSHROOMS = 9
    case LOTSOFHERBS = 10
    case ARTISTIC = 11
    case WARLIKE = 12
}

public let RESOURCELEVELS: Array<ResourceLevel> = [ResourceLevel.NOSPECIALRESOURCES, ResourceLevel.MINERALRICH, ResourceLevel.MINERALPOOR, ResourceLevel.DESERT, ResourceLevel.LOTSOFWATER, ResourceLevel.RICHSOIL, ResourceLevel.POORSOIL, ResourceLevel.RICHFAUNA, ResourceLevel.LIFELESS, ResourceLevel.WEIRDMUSHROOMS, ResourceLevel.LOTSOFHERBS, ResourceLevel.ARTISTIC, ResourceLevel.WARLIKE]
