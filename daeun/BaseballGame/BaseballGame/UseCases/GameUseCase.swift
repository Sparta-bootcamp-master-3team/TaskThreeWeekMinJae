//
//  GameUseCase.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/12/25.
//

/// 게임의 핵심 로직(입력 검증, 정답 비교, 결과 생성)을 처리
final class GameUseCase {
    private let answer: Baseball
    private let menuInputValidator: MenuInputValidator
    private let gameInputValidator: GameInputValidator
    
    init(answer: Baseball = Baseball.random(), menuInputValidator: MenuInputValidator = .init(), gameInputValidator: GameInputValidator = .init()) {
        self.answer = answer
        self.menuInputValidator = menuInputValidator
        self.gameInputValidator = gameInputValidator
    }
    
    func processMenuInput(_ input: String) -> Result<GameMenu, MenuInputValidationError> {
        do {
            try menuInputValidator.validate(input: input)
            let selectedMenu = GameMenu(rawValue: Int(input)!)!
            return .success(selectedMenu)
        } catch let error as MenuInputValidationError {
            return .failure(error)
        } catch {
            return .failure(.unknownError)
        }
    }
    
    func processGameInput(_ input: String) -> Result<Hint, GameInputValidationError> {
        do {
            try gameInputValidator.validate(input: input)
            let guess = convert(input: input)
            let hint = answer.compare(with: guess)
            return .success(hint)
        } catch let error as GameInputValidationError {
            return .failure(error)
        } catch {
            return .failure(.unknownError)
        }
    }
    
    private func convert(input: String) -> [Int] {
        return input.compactMap { Int(String($0)) }
    }
    
    func isCorrect(_ hint: Hint) -> Bool {
        return hint.strike == Baseball.requiredDigitCount
    }
}
