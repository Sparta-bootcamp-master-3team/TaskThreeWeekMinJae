//
//  BaseballGame.swift
//  NumberBaseballGame
//
//  Created by 박주성 on 3/11/25.
//

import Foundation

class BaseballGame {
    let answerArray: [Int]
    
    init() {
        let randomNumbers = (1...9).shuffled()
        self.answerArray = Array(randomNumbers.prefix(3))
    }
}
