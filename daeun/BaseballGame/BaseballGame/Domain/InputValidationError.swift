//
//  InputValidationError.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

enum InputValidationError: Error {
    case notRequiredNumberOfDigits
    case nonDigitCharacters
    case containsZero
    case duplicatedDigits
    
    var errorDescription: String? {
        switch self {
        case .notRequiredNumberOfDigits:
            return "입력값은 \(GameConstants.requiredDigitCount)자리여야 합니다."
        case .nonDigitCharacters:
            return "입력값은 숫자로만 구성되어야 합니다."
        case .containsZero:
            return "입력값에 0은 포함될 수 없습니다."
        case .duplicatedDigits:
            return "입력값에 중복된 숫자가 있습니다."
        }
    }
}
