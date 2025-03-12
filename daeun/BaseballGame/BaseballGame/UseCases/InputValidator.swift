//
//  InputValidator.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

struct InputValidator {
    func validate(input: String) throws {
        guard input.count == GameConstants.requiredDigitCount else {
            throw InputValidationError.notRequiredNumberOfDigits
        }
        
        guard input.allSatisfy({ $0.isNumber }) else {
            throw InputValidationError.nonDigitCharacters
        }
        
        guard !input.contains("0") else {
            throw InputValidationError.containsZero
        }
        
        guard Set(input).count == input.count else {
            throw InputValidationError.duplicatedDigits
        }
    }
}
