//
//  Baseball.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

struct Baseball {
    let numbers: [Int]
    static let requiredDigitCount: Int = 3
    
    func compare(with input: [Int]) -> Hint {
        var strike: Int = 0
        var ball: Int = 0
        
        for i in 0..<Baseball.requiredDigitCount {
            if numbers[i] == input[i] {
                strike += 1
            } else if numbers.contains(input[i]) {
                ball += 1
            }
        }
        
        return Hint(strike: strike, ball: ball)
    }
    
    static func random() -> Baseball {
        var numbers: [Int]
        
        repeat {
            let digits = Array(0...9)
            numbers = Array(digits.shuffled().prefix(Baseball.requiredDigitCount))
        } while numbers.first == 0
        
        return Baseball(numbers: Array(numbers))
    }
}
