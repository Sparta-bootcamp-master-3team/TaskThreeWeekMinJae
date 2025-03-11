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
    
    func start() {
        print("게임을 시작합니다.")
        
        while true {
            print("숫자를 입력해주세요: ", terminator: "")
            guard let input = readLine() else { continue }
            guard let inputNumber = Int(input) else { continue }
            
            var guessArray: [Int] = []
            guard inputNumber >= 100 && inputNumber <= 999 else { continue}
            guessArray = numberToArray(inputNumber)

            
            let (strike, ball): (Int, Int) = calculateStrikeAndBall(guessArray)
            
            guard strike != 3 else { break }
            
            print("\(strike)스트라이크 \(ball)볼")
        }
                  
        print("정답입니다.")
    }
    
    private func numberToArray(_ inputNumber: Int) -> [Int] {
        let hundred = inputNumber / 100
        let ten = inputNumber % 100 / 10
        let one = inputNumber % 10
        
        return [hundred, ten, one]
    }
    
    private func calculateStrikeAndBall(_ guessArray: [Int]) -> (strike: Int, ball: Int) {
        var strike = 0
        var ball = 0
        
        for (index, digit) in answerArray.enumerated() {
            if digit == guessArray[index] {
                strike += 1
            } else if guessArray.contains(digit) {
                ball += 1
            }
        }
        
        return (strike, ball)
    }
}
