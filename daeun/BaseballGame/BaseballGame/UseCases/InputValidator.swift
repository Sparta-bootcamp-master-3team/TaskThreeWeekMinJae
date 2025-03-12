//
//  InputValidator.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

struct InputValidator {
    func validate(input: String) throws {
        guard input.count == Baseball.requiredDigitCount else {
            throw InputValidationError.notRequiredNumberOfDigits
        }
        
        guard input.allSatisfy({ $0.isNumber }) else {
            throw InputValidationError.nonDigitCharacters
        }
        
        guard input.first != "0" else {
            throw InputValidationError.containsZeroInFirst
        }
        
        guard Set(input).count == input.count else {
            throw InputValidationError.duplicatedDigits
        }
    }
}
