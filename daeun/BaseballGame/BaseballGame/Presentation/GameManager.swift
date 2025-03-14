//
//  GameManager.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

/// 사용자의 입출력 및 게임 흐름 제어에 집중
// TODO: 입출력 역할 분리 시도
final class GameManager {
    private let gameUseCase: GameUseCase
    private var recordManager: RecordManager
    private var exitGame: Bool = false
    
    init(gameUseCase: GameUseCase = .init(), recordManager: RecordManager = .init()) {
        self.gameUseCase = gameUseCase
        self.recordManager = recordManager
    }
    
    func start() {
        greeting()
        
        while !exitGame {
            selectMenu()
        }
    }
    
    private func selectMenu() {
        presentMenuOptions()
        
        switch gameUseCase.processMenuInput(getUserInput()) {
        case .success(let menu):
            print()
            handleMenuSelection(menu: menu)
        case .failure(let error):
            print(error.errorDescription ?? error.localizedDescription)
        }
        print()
    }
    
    private func handleMenuSelection(menu: GameMenu) {
        switch menu {
        case .start: startGame()
        case .log: recordManager.showLog()
        case .end: endGame()
        }
    }
    
    private func startGame() {
        print("< 게임을 시작합니다 >")
        var tryCounter: Int = 0
        
        while true {
            print("숫자를 입력하세요")
            
            switch gameUseCase.processGameInput(getUserInput()) {
            case .success(let hint):
                tryCounter += 1
                showMessage(of: hint)
                
                if gameUseCase.isCorrect(hint) {
                    recordManager.addRecord(newRecord: tryCounter)
                    return
                }
            case .failure(let error):
                print(error.errorDescription ?? error.localizedDescription)
            }
            
            print()
        }
    }
    
    private func getUserInput() -> String {
        return readLine() ?? ""
    }
    
    private func showMessage(of hint: Hint) {
        switch (hint.strike, hint.ball) {
        case (0, 0):
            print("Nothing")
        case (Baseball.requiredDigitCount, _):
            print("정답입니다!")
        default:
            print("\(hint.strike)스트라이크 \(hint.ball)볼")
        }
    }
    
    private func endGame() {
        print("< 숫자 야구 게임을 종료합니다 >")
        exitGame = true
    }
}

// 입출력 메서드
extension GameManager {
    private func greeting() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
    }
    
    private func presentMenuOptions() {
        print(GameMenu.allCases.map { "\($0.rawValue). \($0.description)" }.joined(separator: " "))
    }
}
