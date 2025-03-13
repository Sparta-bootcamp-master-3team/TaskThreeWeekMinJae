//
//  BaseballGame.swift
//  NumberBaseballGame
//
//  Created by 박주성 on 3/11/25.
//

import Foundation

// MARK: Status Enum 정의
enum Status {
    static let activeCount: Int = 3
    
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

// MARK: BaseballGame 클래스 정의
class BaseballGame {
    // 정답 숫자 배열
    private var answerArray: [Int] = []
    // 현재 게임 상태
    private var status: Status = .none
    // 게임 기록 배열
    private var recordArray: [Int] = []
    
    // MARK: - 게임 메뉴 출력 및 입력 처리
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
                print("\n종료합니다.")
                return
            case .none:
                print("올바르지 않은 입력값입니다.\n")
            }
        }
    }
    
    // MARK: - 게임 시작 로직
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
            record += 1
            
            status = Status.play(strike: strike, ball: ball)
            switch status {
            case .play(strike: 3, ball: _):
                recordArray.append(record)
                print("정답입니다.\n")
                return
            case .play(strike: 0, ball: 0):
                print("Nothing\n")
            case .play(let strike, let ball):
                print("\(strike)스트라이크, \(ball)볼 (\(record)번째 시도)")
            default:
                print("ERROR")
                return
            }
        }
    }
    
    // MARK: - 게임 기록 출력
    private func showRecord() {
        if recordArray.isEmpty {
            print("아직 플레이한 게임이 없습니다.\n")
            return
        }
        
        print()
        for (index, record) in recordArray.enumerated() {
            print("\(index + 1)번째 게임 시도 횟수 : \(record)")
        }
        print()
    }
    
    // MARK: - 정답 숫자 배열 생성
    private func setupAnswer() {
        var randomNumbers = (0...9).shuffled().prefix(3)
        
        // 배열의 첫 번째 숫자가 0이면 뒤집어서 0이 끝에 오도록 처리
        if randomNumbers.first == 0 {
            randomNumbers.reverse()
        }
        
        answerArray = Array(randomNumbers)
    }
    
    // MARK: - 입력 검증 관련 메소드
    // 메뉴 입력 검증 (1~3 숫자)
    private func isValidMenuInput(_ input: String) -> Bool {
        guard let inputNumber = Int(input) else {
            print("올바르지 않은 입력값입니다.\n")
            return false
        }
        
        guard (1...Status.activeCount).contains(inputNumber) else {
            print("1, 2, 3 중에서 숫자를 입력해주세요.\n")
            return false
        }
        
        return true
    }
    
    // 게임 진행 시 입력 검증 (3자리 숫자)
    private func isVaildGameInput(_ input: String) -> Bool {
        guard Int(input) != nil else {
            print("올바르지 않은 입력값입니다.\n")
            return false
        }
        
        guard answerArray.count == input.count else {
            print("3자리 숫자를 입력해주세요.\n")
            return false
        }
        
        return true
    }
    
    // 배열 내 중복된 숫자 검증
    private func isVaildDuplication(_ guessArray: [Int]) -> Bool {
        guard Set(guessArray).count == guessArray.count else {
            print("\n중복된 숫자가 있습니다.\n")
            return false
        }
        
        return true
    }
    
    // MARK: - 입력값 변환 및 계산 관련 메소드
    // 문자열 입력을 숫자 배열로 변환
    private func inputToArray(_ input: String) -> [Int] {
        return input.split(separator: "").compactMap { Int($0) }
    }
    
    // 스트라이크와 볼 개수 계산
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
    
    // 메뉴 입력 값을 Status enum으로 변환
    private func inputToStatus(_ input: String) -> Status {
        guard let inputNumber = Int(input), let status = Status(rawValue: inputNumber) else {
            return Status.none
        }
        
        return status
    }
}
