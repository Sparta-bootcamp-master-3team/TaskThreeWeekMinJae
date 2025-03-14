//
//  InputValidator.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

struct GameInputValidator: Validatable {
    func validate(input: String) throws {
        guard input.count == Baseball.requiredDigitCount else {
            throw GameInputValidationError.notRequiredNumberOfDigits
        }
        
        guard input.allSatisfy({ $0.isNumber }) else {
            throw GameInputValidationError.nonDigitCharacters
        }
        
        guard input.first != "0" else {
            throw GameInputValidationError.containsZeroInFirst
        }
        
        guard Set(input).count == input.count else {
            throw GameInputValidationError.duplicatedDigits
        }
    }
}
