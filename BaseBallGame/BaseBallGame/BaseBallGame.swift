//
//  BaseBallGame.swift
//  BaseBallGame
//
//  Created by 송규섭 on 3/11/25.
//

import Foundation

struct BaseBallGame {
    func start() {
        var gameHistory = [GameHistory]()
        var gameCount = 0
        while true {
            
            // MARK: - Onboarding
        
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 게임 설명 보기  4. 종료하기")
            
            let mode = readLine()
            
            switch mode {
                
            case "1":
                var repeatedCount = 0
                var myStrikeList = [Int]()
                let answer = makeAnswer()
                
                gameCount += 1
                
                while true {
                    
                    if repeatedCount == 0 { print("< 게임을 시작합니다 >") }
                    
                    // MARK: - 사용자로부터 입력 값 입력 및 유효성 검증
                    print("숫자를 입력하세요")
                    let myNumber = readLine()
                    guard let input = myNumber, let intTypeInput = Int(input), intTypeInput >= 100, intTypeInput <= 999 else {
                        print("올바르지 않은 입력값입니다.")
                        continue
                    }
                    
                    // MARK: - 기존 정답과 인풋에 대한 스트라이크, 볼, 정답 여부 확인 로직
                    let answerString = String(answer)
                    
                    myStrikeList = findStrike(answer: answerString, myNum: input)
                    
                    let ballCount = findBall(answer: answerString, myNum: input, myStrikeList: myStrikeList)
                    
                    if myStrikeList.count == 3 {
                        print("정답입니다!")
                        let history = GameHistory(gameNumber: gameCount, tryCount: repeatedCount)
                        gameHistory.append(history)
                        break
                    } else {
                        repeatedCount += 1
                        print("\(myStrikeList.count) 스트라이크, \(ballCount) 볼")
                    }
                    
                }
                
            case "2":
                print("< 게임 기록 보기 >")
                
                if gameHistory.isEmpty {
                    print("게임을 플레이하신 내역이 없습니다. 게임을 플레이해주세요!\n")
                } else {
                    print("게임 기록을 불러오는 중입니다...")
                    usleep(1500000)
                    
                    gameHistory.forEach { history in
                        history.presentTryCount()
                    }
                    print("\n")
                }
                
            case "3":
                print("===== 숫자 야구 게임 설명 =====")
                print("1. 컴퓨터가 서로 다른 3자리 숫자를 무작위로 생성합니다 (첫 자리는 0이 올 수 없음)")
                print("2. 사용자가 3자리 숫자를 입력합니다")
                print("3. 컴퓨터는 숫자와 위치가 모두 맞으면 '스트라이크', 숫자는 맞지만 위치가 다르면 '볼'로 알려줍니다")
                print("   예) 정답: 874, 입력: 847 → 1스트라이크 2볼")
                print("4. 3개의 숫자를 모두 맞추면(3스트라이크) 게임 승리!")
                print("5. 게임 기록은 '게임 기록 보기' 메뉴에서 확인할 수 있습니다")
                print("=============================")
            case "4":
                print("< 숫자 야구 게임을 종료합니다 >\n")
                return
            default:
                print("올바른 숫자를 입력해주세요!\n")
            }
        }
    }
    
    func makeAnswer() -> Int {
        while true {
            let answer = Int.random(in: 100...999)
            
            let hundredsNum = answer / 100
            let tensNum = (answer - (hundredsNum * 100)) / 10
            let oneNum = (answer - (hundredsNum * 100)) % 10
            
            guard (hundredsNum != tensNum) && (tensNum != oneNum) && (hundredsNum != oneNum) && (hundredsNum != 0) else {
                continue
            }
            
            return answer
        }
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
                    if !myStrikeList.contains(myNumIndex) && !myStrikeList.contains(answerIndex) {
                        ballCount += 1
                    }
                }
            }
        }
        
        return ballCount
    }
    
}
