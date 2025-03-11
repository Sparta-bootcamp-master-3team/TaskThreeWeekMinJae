//
//  GameManager.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

final class GameManager {
    let answer: Baseball
    let validator: InputValidator
    
    init() {
        self.answer = GameManager.generateValidAnswer()
        self.validator = InputValidator()
    }
    
    static private func generateValidAnswer() -> Baseball {
        return Baseball.random()
    }
    
    func startGame() {
        print("< 게임을 시작합니다 >")
        
        var gameOver = false
        
        while !gameOver {
            let userInput = getUserInput()
            do {
                try validator.validate(input: userInput)
                let guess = convert(input: userInput)
                let hint = answer.compare(with: guess)
                print(hint.message)
                
                if hint.isCorrect {
                    gameOver = true
                }
            } catch {
                if let inputValidationError = error as? InputValidationError {
                    print(inputValidationError.errorDescription ?? error)
                }
            }
            print()
        }
    }
    
    func getUserInput() -> String {
        print("숫자를 입력하세요")
        return readLine() ?? ""
    }
    
    func convert(input: String) -> [Int] {
        return input.compactMap { Int(String($0)) }
    }
}
