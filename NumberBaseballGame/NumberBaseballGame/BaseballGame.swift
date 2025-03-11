//
//  BaseballGame.swift
//  NumberBaseballGame
//
//  Created by 박주성 on 3/11/25.
//

enum Status: Int {
    case none
    case play
    case record
    case quit
}

import Foundation

class BaseballGame {
    var answerArray: [Int] = []
    
    private var status: Status = .none
    
    private var recordArray: [Int] = []
    
    init() {
        
    }
    
    func showMenu() {
        while true {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            print("원하시는 숫자를 입력해주세요: ", terminator: "")
            
            guard let input = readLine(), let inputNumber = isVaildNumber(input, digits: 1) else { continue }
            
            status = Status(rawValue: Int(inputNumber))!
            switch status {
                case .play:
                startGame()
            case .record:
                showRecord()
            case .quit:
                break
            case .none:
                print("ERROR")
                return
            }
        }
    }
    
    private func startGame() {
        setupAnswer()
        var record: Int = 0
        print("게임을 시작합니다. \(answerArray)")
        
        while true {
            print("숫자를 입력해주세요: ", terminator: "")
            guard let input = readLine(), let inputNumber = isVaildNumber(input, digits: 3) else { continue }
            
            let guessArray = numberToArray(inputNumber)
            guard isVaildDuplication(guessArray) else { continue }
            
            let (strike, ball): (Int, Int) = calculateStrikeAndBall(guessArray)
            
            guard strike != 3 else { break }
            
            if strike == 0 && ball == 0 {
                print("Nothing")
            } else {
                print("\(strike)스트라이크 \(ball)볼")
                
            }
            
            record += 1
        }
        recordArray.append(record)
        
        print("정답입니다.")
    }
    
    private func showRecord() {
        if recordArray.isEmpty {
            print("아직 플레이한 게임이 없습니다.")
            return
        }
        
        for (index, record) in recordArray.enumerated() {
            print("\(index + 1)번째 게임 시도 횟수 : \(record)")
        }
    }
    
    private func setupAnswer() {
        var randomNumbers = (0...9).shuffled().prefix(3)
        
        if randomNumbers.first == 0 {
            randomNumbers.reverse()
        }
        
        answerArray = Array(randomNumbers)
    }
    
    private func isVaildNumber(_ input: String, digits: Int) -> Int? {
        guard !input.isEmpty, let inputNumber = Int(input) else {
            print("\n올바르지 않은 입력값입니다.\n")
            return nil
        }
        
        if digits == 1 {
            guard inputNumber >= 1 && inputNumber <= 3 else {
                print("\n1, 2, 3 중에서 숫자를 입력해주세요.\n")
                return nil
            }
        } else if digits == 3 {
            guard inputNumber >= 100 && inputNumber <= 999 else {
                print("\n3자리 숫자를 입력해주세요.\n")
                return nil
            }
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
