//
//  GameHistory.swift
//  BaseBallGame
//
//  Created by 송규섭 on 3/11/25.
//

import Foundation

struct GameHistory {
    let gameNumber: Int
    let tryCount: Int
    
    func presentTryCount() {
        print("\(gameNumber)번째 게임 : 시도 횟수 - \(tryCount)")
    }
}
