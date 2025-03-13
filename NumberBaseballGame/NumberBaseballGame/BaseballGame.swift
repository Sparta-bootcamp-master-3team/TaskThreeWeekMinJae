//
//  BaseballGame.swift
//  NumberBaseballGame
//
//  Created by 박주성 on 3/11/25.
//

import Foundation

enum Status {
    case none
    case play(strike: Int, ball: Int)
    case record
    case quit
    
    init?(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .none
        case 1:
            self = .play(strike: 0, ball: 0)
        case 2:
            self = .record
        case 3:
            self = .quit
        default:
            return nil
        }
    }
}

class BaseballGame {
    var answerArray: [Int] = []
    
    private var status: Status = .none
    
    private var recordArray: [Int] = []
    
    
    func showMenu() {
        while true {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            print("원하시는 숫자를 입력해주세요: ", terminator: "")
            
            guard let input = readLine(), isValidMenuInput(input) else { continue }
            
            status = inputToStatus(input)
            switch status {
            case .play:
                startGame()
            case .record:
                showRecord()
            case .quit:
                return
            case .none:
                print("올바르지 않은 입력값입니다.\n")
            }
        }
    }
    
    private func startGame() {
        setupAnswer()
        var record: Int = 0
        print("\n게임을 시작합니다. \(answerArray)")
        
        while true {
            print("숫자를 입력해주세요: ", terminator: "")
            guard let input = readLine(), isVaildGameInput(input) else { continue }
            
            let guessArray = inputToArray(input)
            guard isVaildDuplication(guessArray) else { continue }
            
            let (strike, ball): (Int, Int) = calculateStrikeAndBall(guessArray)
            status = Status.play(strike: strike, ball: ball)
            
            switch status {
            case .play(strike: 3, ball: _):
                return
            case .play(strike: 0, ball: 0):
                print("Nothing\n")
            case .play(let strike, let ball):
                print("\(strike)스트라이크, \(ball)볼")
            default:
                print("ERROR")
            }

            
            record += 1
        }
        recordArray.append(record)
        
        print("정답입니다.\n")
    }
    
    private func showRecord() {
        if recordArray.isEmpty {
            print("아직 플레이한 게임이 없습니다.\n")
            return
        }
        
        for (index, record) in recordArray.enumerated() {
            print("\n\(index + 1)번째 게임 시도 횟수 : \(record)\n")
        }
    }
    
    private func setupAnswer() {
        var randomNumbers = (0...9).shuffled().prefix(3)
        
        if randomNumbers.first == 0 {
            randomNumbers.reverse()
        }
        
        answerArray = Array(randomNumbers)
    }
    
    private func isVaildGameInput(_ input: String) -> Bool {
        guard let inputNumber = Int(input) else {
            print("올바르지 않은 입력값입니다.\n")
            return false
        }
        
        guard (100...999).contains(inputNumber) else {
            print("3자리 숫자를 입력해주세요.\n")
            return false
        }
        
        return true
    }
    
    private func isValidMenuInput(_ input: String) -> Bool {
        guard let inputNumber = Int(input) else {
            print("올바르지 않은 입력값입니다.\n")
            return false
        }
        
        guard (1...3).contains(inputNumber) else {
            print("1, 2, 3 중에서 숫자를 입력해주세요.\n")
            return false
        }
        
        return true
    }

    private func isVaildDuplication(_ guessArray: [Int]) -> Bool {
        guard Set(guessArray).count == guessArray.count else {
            print("\n중복된 숫자가 있습니다.\n")
            return false
        }

        return true
    }
    
    private func inputToArray(_ input: String) -> [Int] {
        return input.split(separator: "").compactMap { Int($0) }
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
    
    private func inputToStatus(_ input: String) -> Status {
        guard let inputNumber = Int(input), let status = Status(rawValue: inputNumber) else {
            return Status.none
        }
        
        return status
    }
}
