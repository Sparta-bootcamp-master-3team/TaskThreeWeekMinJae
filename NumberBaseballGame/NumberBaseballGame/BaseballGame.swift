//
//  BaseballGame.swift
//  NumberBaseballGame
//
//  Created by 박주성 on 3/11/25.
//

import Foundation

class BaseballGame {
    lazy var answerArray: [Int] = {
        setupAnswer()
    }()
    
    init() {
        
    }
    
    func start() {
        print("게임을 시작합니다.")
        
        while true {
            print("숫자를 입력해주세요: ", terminator: "")
            guard let input = readLine(), let inputNumber = isVaildNumber(input) else { continue }
            
            let guessArray = numberToArray(inputNumber)
            guard isVaildDuplication(guessArray) else { continue }
            guard isVaildZero(guessArray) else { continue }
            
            let (strike, ball): (Int, Int) = calculateStrikeAndBall(guessArray)
            
            guard strike != 3 else { break }
            
            if strike == 0 && ball == 0 {
                print("Nothing")
            } else {
                print("\(strike)스트라이크 \(ball)볼")
                
            }
        }
                  
        print("정답입니다.")
    }
    
    private func setupAnswer() -> [Int] {
        var randomNumbers = (0...9).shuffled().prefix(3)
        
        if randomNumbers.first == 0 {
            randomNumbers.reverse()
        }
        
        return Array(randomNumbers)
    }
    
    private func isVaildNumber(_ input: String) -> Int? {
        guard !input.isEmpty, let inputNumber = Int(input) else {
            print("\n올바르지 않은 입력값입니다.\n")
            return nil
        }
        
        guard inputNumber >= 100 && inputNumber <= 999 else {
            print("\n3자리 숫자를 입력해주세요.\n")
            return nil
        }
        
        return inputNumber
    }
    
    private func isVaildDuplication(_ guessArray: [Int]) -> Bool {
        guard Set(guessArray).count == 3 else {
            print("\n중복된 숫자가 있습니다.\n")
            return false
        }

        return true
    }
    
    private func isVaildZero(_ guessArray: [Int]) -> Bool {
        if guessArray.contains(0) {
            print("\n0은 사용할 수 없습니다.\n")
            return false
        }
        
        return true
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
