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
    
    init(gameUseCase: GameUseCase = GameUseCase()) {
        self.gameUseCase = gameUseCase
    }
    
    func startGame() {
        print("< 게임을 시작합니다 >")
        
        var gameOver: Bool = false
        
        while !gameOver {
            let userInput = getUserInput()
            
            switch gameUseCase.processInput(userInput) {
            case .failure(let error):
                print(error.errorDescription ?? error.localizedDescription)
            case .success(let hint):
                showMessage(of: hint)
                
                if gameUseCase.isCorrect(hint) {
                    gameOver = true
                }
            }
            
            print()
        }
    }
    
    private func getUserInput() -> String {
        print("숫자를 입력하세요")
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
}
