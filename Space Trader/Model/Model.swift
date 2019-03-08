//
//  Model.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation
import Firebase

class Model {
    
    public private(set) static var instance: Model = Model();
    public private(set) var repo: Repository;
    
    private init() {
        self.repo = Repository()
    }
}
