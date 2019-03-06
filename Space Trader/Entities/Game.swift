//
//  Game.swift
//  Space Trader
//
//  Created by Max Zuo on 3/6/19.
//  Copyright © 2019 Max Zuo. All rights reserved.
//

import Foundation

enum GameDifficulty: Int {
    case EASY = 0
    case NORMAL = 1
    case HARD = 2
    case IMPOSSIBLE = 3
}


class Game {
    public private(set) var gameDifficulty: GameDifficulty
    public private(set) var player: Player?
    public private(set) var universe: Universe
    
    public init(player: Player? = nil, gameDifficulty: GameDifficulty = GameDifficulty.EASY,
                universe: Universe = Universe()) {
        if let _ = player {
            self.player = player
        }
        self.gameDifficulty = gameDifficulty
        self.universe = universe
    }
    
    /*
     Loads the specified player into the game
     */
    
    public func loadPlayer(player: Player) -> Void {
        self.player = player
    }
    
    /*
     Loads universe into game
     */
    public func loadUniverse(universe: Universe = Universe()) -> Void {
        self.universe = universe;
    }
    
    /*
     Changes difficulty of the game
     */
    public func changeDifficulty(difficulty: GameDifficulty) -> Void {
        self.gameDifficulty = difficulty
    }
    
}
