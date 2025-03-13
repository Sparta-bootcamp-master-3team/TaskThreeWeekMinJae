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
        
        // 첫번째 값이 0이 되지 않게 하기 위함
        let firstValue = Int.random(in: 1...9)
        randomValues.insert(firstValue)
        
        while randomValues.count < 3 {
            let value = Int.random(in: 0...9)
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
            
            // input의 길이가 3이 아니거나 0이 포함되면
            guard inputInt.count == 3, Set(inputInt).count == 3, inputInt[0] != 0 else {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            return inputInt
        }
    }
}

// 게임 기록 class
class RecordManager {
    private var recordArray = [Int]()
    
    func addRecord(count: Int) {
        recordArray.append(count)
    }
    
    func recordPlayTimes() {
        if recordArray.isEmpty {
            print("아직 시작하지 않았습니다.")
        }
        for i in 0..<recordArray.count {
            print("\(i + 1)번째 게임: 시도 횟수 - \(recordArray[i])")
        }
        print("")
    }
}

// main class
class BaseballGame {
    let randomValue = RandomValue()
    let inputValue = InputValue()
    let recordManager = RecordManager()
    
    // 랜덤값과 사용자 값을 비교하는 메서드
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

        if strike == 3 {
            print("정답")
            return true // 종료
        } else if strike > 0 || ball > 0 {
            print("\(strike)스트라이크 \(ball)볼")
        } else {
            print("Nothing")
        }

        return false // 다시
    }
    
    // 필수 구현 매서드
    func active() {
        let answer = randomValue.getRandom()
        var isCorrect = false
        var recordCounter = 0
        
        while !isCorrect {
            let userInput = inputValue.getInput()
            isCorrect = compare(answer: answer, input: userInput)
            recordCounter += 1
            print("")
        }
        // 게임 종료 후 횟수 저장
        recordManager.addRecord(count: recordCounter)
    }
    
    func start() {
        print("< 환영합니다! 원하시는 번호를 입력해주세요 >")
        while true {
            print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            guard let startNum = readLine() else { return }
            
            switch startNum {
            case "1":
                active()
            case "2":
                recordManager.recordPlayTimes()
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
