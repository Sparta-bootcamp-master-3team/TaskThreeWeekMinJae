//
//  Hint.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

struct Hint {
    let strike: Int
    let ball: Int
    
    var message: String {
        switch (strike, ball) {
        case (0, 0):
            return "Nothing"
        case (GameConstants.requiredDigitCount, _):
            return "정답입니다!"
        default:
            return "\(strike)스트라이크 \(ball)볼"
        }
    }
    
    var isCorrect: Bool { strike == GameConstants.requiredDigitCount }
}
