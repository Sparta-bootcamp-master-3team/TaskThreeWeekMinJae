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
    private var gameOver: Bool = false
    
    init(gameUseCase: GameUseCase = GameUseCase()) {
        self.gameUseCase = gameUseCase
    }
    
    func selectMenu() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        
        while !gameOver {
            showMenu()
        }
    }
    
    private func showMenu() {
        print("1. 게임 시작하기 2. 게임 기록보기 3. 종료하기")
        
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
        case .log: break
        case .end: endGame()
        }
    }
    
    private func startGame() {
        print("< 게임을 시작합니다 >")
        
        while !gameOver {
            print("숫자를 입력하세요")
            
            switch gameUseCase.processGameInput(getUserInput()) {
            case .success(let hint):
                showMessage(of: hint)
                
                if gameUseCase.isCorrect(hint) {
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
        gameOver = true
    }
}
