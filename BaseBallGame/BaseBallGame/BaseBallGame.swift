//
//  BaseBallGame.swift
//  BaseBallGame
//
//  Created by 송규섭 on 3/11/25.
//

import Foundation

struct BaseBallGame {
    func start() {
        let answer = makeAnswer()
        var repeatedCount = 0
        var myStrikeList = [Int]()
        
        print(answer)
        
        while true {
            if repeatedCount == 0 { print("< 게임을 시작합니다 >") }
            
            repeatedCount += 1
            
            print("숫자를 입력하세요")
            let myInitialNumber = readLine()
            
            guard let myNumber = isValidInput(input: myInitialNumber) else { return }
            
            let answerString = String(answer)
            
            myStrikeList = findStrike(answer: answerString, myNum: myNumber)
            
            let ballCount = findBall(answer: answerString, myNum: myNumber, myStrikeList: myStrikeList)
            
            if myStrikeList.count == 3 {
                print("정답입니다!")
                break
            } else {
                print("\(myStrikeList.count) 스트라이크, \(ballCount) 볼")
            }
            
        }
    }
    
    func makeAnswer() -> Int {
        while true {
            let answer = Int.random(in: 100...999)
            
            let hundredsNum = answer / 100
            let tensNum = (answer - (hundredsNum * 100)) / 10
            let oneNum = (answer - (hundredsNum * 100)) % 10
            
            guard (hundredsNum != tensNum) && (tensNum != oneNum) && (hundredsNum != oneNum) else {
                continue
            }
            
            return answer
        }
    }
    
    func isValidInput(input: String?) -> String? {
        
        guard let input = input, let intTypeInput = Int(input), intTypeInput >= 100, intTypeInput <= 999 else {
            print("올바르지 않은 입력값입니다.")
            return nil
        }
        
        return input
    }
    
    func findStrike(answer: String, myNum: String) -> [Int] {
        var strikeList = [Int]()
        
        for i in 0...2 {
            let answerIndex = answer.index(answer.startIndex, offsetBy: i)
            let myNumberIndex = myNum.index(myNum.startIndex, offsetBy: i)
            
            if answer[answerIndex] == myNum[myNumberIndex] {
                strikeList.append(i)
            }
        }
        
        return strikeList
    }
    
    func findBall(answer: String, myNum: String, myStrikeList: [Int]) -> Int {
        var ballCount = 0
        
        for (answerIndex, i) in answer.enumerated() {
            for (myNumIndex, j) in myNum.enumerated() {
                if i == j {
                    print("\(i)와 \(j)가 일치")
                    if !myStrikeList.contains(myNumIndex) && !myStrikeList.contains(answerIndex) {
                        ballCount += 1
                    }
                }
            }
        }
        
        return ballCount
    }
}
