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
        var randomValues = Set<Int>() // 중복값을 받지 않기 위해 Set
        
        while randomValues.count < 3 {
            let value = Int.random(in: 0...9) // 0-9 랜덤값
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
            guard let input = readLine(), !input.isEmpty else { // input에 값이 없다면
                print("올바르지 않은 입력값입니다")
                continue
            } // readLine()은 Optional(String)값이다
            
            inputInt = input.compactMap{ Int(String($0)) }
            // readLine()으로 받은 값을 Int로 형변환하고 배열에 저장함
            
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
            
            if answer[index] == input[index] { // 인덱스로 위치와 값이 같다면 1씩 증가
                strike += 1
            } else if answer.contains(input[index]) { // 인덱스로 위치는 다르지만 값이 같다면 1씩 증가
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
    
    func start() {
        let answer = randomValue.getRandom()
        var isCorrect = false
        
        while !isCorrect {
            let userInput = inputValue.getInput()
            isCorrect = hintCompare.compare(answer: answer, input: userInput)
        }
    }
}

// 실행
let game = BaseballGame()
game.start()
