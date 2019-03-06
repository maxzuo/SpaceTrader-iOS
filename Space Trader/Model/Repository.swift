//
//  Repository.swift
//  Space Trader
//
//  Created by Zhaohui Li on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation
import Firebase

class Repository {
    
    private var game: Game!
    
    public init() {
        self.game = loadGame()
    }
    
    /*
     Currently doesn't really do anything. Once Firebase is implemented,
     it will pull the state of the game from the server.
     */
    private func loadGame() -> Game {
        return Game()
    }
    
    /*
     Currently does nothing. Once Firebase is implemented,
     this will push game settings to server. Essentially a
     save method
     */
    public func update() -> Bool {
        
        return true
    }
    
    public func newGame(game: Game) -> Void { self.game = game }
    
    public func getPlayer() -> Player? { return self.game.player }
}
