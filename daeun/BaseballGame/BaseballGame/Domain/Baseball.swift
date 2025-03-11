//
//  Baseball.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

struct Baseball {
    let numbers: [Int]
    
    func compare(with input: [Int]) -> Hint {
        var strike: Int = 0
        var ball: Int = 0
        
        for i in 0..<GameConstants.requiredDigitCount {
            if numbers[i] == input[i] {
                strike += 1
            } else if numbers.contains(input[i]) {
                ball += 1
            }
        }
        
        return Hint(strike: strike, ball: ball)
    }
    
    static func random() -> Baseball {
        let randomNumbers = (1...9).shuffled().prefix(GameConstants.requiredDigitCount)
        return Baseball(numbers: Array(randomNumbers))
    }
}
