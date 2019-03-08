//
//  Sun.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

class Sun {
    
    public private(set) var size: Int
    public static let MAXSIZE: Int = 15
    
    public init(size: Int! = Int.random(in: 1...MAXSIZE)) {
        self.size = size
    }
}
