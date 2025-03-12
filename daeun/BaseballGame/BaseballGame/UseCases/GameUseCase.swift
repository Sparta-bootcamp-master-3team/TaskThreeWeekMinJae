//
//  GameUseCase.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/12/25.
//

/// 게임의 핵심 로직(입력 검증, 정답 비교, 결과 생성)을 처리
final class GameUseCase {
    private let answer: Baseball
    private let inputValidator: InputValidator
    
    init(answer: Baseball = Baseball.random(), inputValidator: InputValidator = InputValidator()) {
        self.answer = answer
        self.inputValidator = inputValidator
    }
    
    func processInput(_ input: String) -> Result<Hint, InputValidationError> {
        do {
            try inputValidator.validate(input: input)
            let guess = convert(input: input)
            let hint = answer.compare(with: guess)
            return .success(hint)
        } catch let error as InputValidationError {
            return .failure(error)
        } catch {
            // TODO: 기본 오류 메세지 추가 후 변경
            return .failure(.nonDigitCharacters)
        }
    }
    
    private func convert(input: String) -> [Int] {
        return input.compactMap { Int(String($0)) }
    }
    
    func isCorrect(_ hint: Hint) -> Bool {
        return hint.strike == GameConstants.requiredDigitCount
    }
}
