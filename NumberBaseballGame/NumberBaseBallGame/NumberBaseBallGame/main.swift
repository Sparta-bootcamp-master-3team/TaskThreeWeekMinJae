//
//  main.swift
//  NumberBaseBallGame
//
//  Created by main on 3/11/25.
//

import Foundation

// 랜덤값 class
class RandomValue {
    
    func getRandom() -> [Int] {
        var randomValues = Set<Int>()
        
        while randomValues.count < 3 {
            let value = randomValues.isEmpty ? Int.random(in: 1...9) : Int.random(in: 0...9)
            randomValues.insert(value)
        }
        return Array(randomValues)
    }
}

// 입력값 class
class InputValue {
    
    func getInput() -> [Int] {
        var inputInt = [Int]()
        
        while true {
            print("숫자를 입력하세요 ")
            guard let input = readLine(), !input.isEmpty else {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            inputInt = input.compactMap{ Int(String($0)) }
            
            guard inputInt.count == 3, // input의 길이가 3이 아니거나 0이 포함되면
                  Set(inputInt).count == 3, inputInt[0] != 0 else {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            return inputInt
        }
    }
}

// 힌트 비교 class
class HintCompare {
    
    func compare(answer: [Int], input: [Int]) -> Bool {
        var strike = 0
        var ball = 0
        
        for index in 0..<input.count {
            
            if answer[index] == input[index] {
                strike += 1
            } else if answer.contains(input[index]) {
                ball += 1
            }
            
        }
        
        if strike == 3 && ball == 0 {
            print("정답")
            return true // 종료
        } else if strike > 0 || ball > 0 {
            print("\(strike)스트라이크 \(ball)볼")
        } else {
            print("Nothing")
        }
        
        return false // 다시
    }
}

// main class
class BaseballGame {
    let randomValue = RandomValue()
    let inputValue = InputValue()
    let hintCompare = HintCompare()
    
    func active() {
        let answer = randomValue.getRandom()
        var isCorrect = false
        
        while !isCorrect {
            let userInput = inputValue.getInput()
            isCorrect = hintCompare.compare(answer: answer, input: userInput)
            print("")
        }
    }
    
    func start() {
        print("< 환영합니다! 원하시는 번호를 입력해주세요 >")
        while true {
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let startNum = readLine() else { return }
            
            switch startNum {
            case "1":
                active()
            case "3":
                print("< 숫자 야구 게임을 종료합니다 >")
                return
            default:
                print("올바른 숫자를 입력해주세요")
                print("")
            }
        }
    }
}

// 실행
let game = BaseballGame()
game.start()
