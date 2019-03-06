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
    
    private var instance: Model = Model();
    private var repo: Repository;
    
    public func getModel() -> Model {
        return self.instance;
    }
    
    private init() {
        self.repo = Repository()
    }
}
