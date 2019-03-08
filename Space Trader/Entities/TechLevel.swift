//
//  TechLevel.swift
//  Space Trader
//
//  Created by Zhaohui Li on 3/8/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

public enum TechLevel: Int {
    case PRE_AGRICULTURE = 0
    case AGRICULTURE = 1
    case MEDIEVAL = 2
    case RENAISSANCE = 3
    case EARLY_INDUSTRIAL = 4
    case INDUSTRIAL = 5
    case POST_INDUSTRIAL = 6
    case HI_TECH = 7
}

public let TECHLEVELS: Array<TechLevel> = [TechLevel.PRE_AGRICULTURE, TechLevel.AGRICULTURE, TechLevel.MEDIEVAL, TechLevel.RENAISSANCE, TechLevel.EARLY_INDUSTRIAL, TechLevel.INDUSTRIAL, TechLevel.POST_INDUSTRIAL, TechLevel.HI_TECH]

// ^^^ Questionable coding ethics LOLZ.
