//
//  BaseballGame.swift
//  NumberBaseBallGame
//
//  Created by 조선우 on 3/13/25.
//

import Foundation

// 실행 class
class BaseballGame {
    let randomValue = RandomValue()
    let inputValue = InputValue()
    let recordManager = RecordManager()
    let hintCompare = HintCompare()
    
    // 필수 구현 매서드
    func active() {
        let answer = randomValue.getRandom()
        var isCorrect = false
        var recordCount = 0
        
        while !isCorrect {
            let userInput = inputValue.getInput()
            isCorrect = hintCompare.compare(answer: answer, input: userInput)
            recordCount += 1
        }
        // 게임 종료 후 횟수 저장
        recordManager.addRecord(count: recordCount)
    }
    
    func start() {
        print("< 🎇환영합니다! 원하시는 번호를 입력해주세요🔢 >")
        while true {
            print("1️⃣ 게임 시작하기 2️⃣ 게임 기록 보기 3️⃣ 종료하기")
            
            guard let startNum = readLine() else { return }
            
            switch startNum {
            case "1":
                active()
            case "2":
                recordManager.recordPlayTimes()
            case "3":
                print("< 숫자 야구 게임을 종료합니다 🔚>\n")
                return
            default:
                print("올바른 숫자를 입력해주세요\n")
            }
        }
    }
}
