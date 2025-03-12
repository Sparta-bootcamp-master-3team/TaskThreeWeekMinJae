//
//  InputValidationError.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/11/25.
//

import Foundation

enum InputValidationError: Error {
    case notRequiredNumberOfDigits
    case nonDigitCharacters
    case containsZero
    case duplicatedDigits
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .notRequiredNumberOfDigits:
            return "입력값은 \(Baseball.requiredDigitCount)자리여야 합니다."
        case .nonDigitCharacters:
            return "입력값은 숫자로만 구성되어야 합니다."
        case .containsZero:
            return "입력값에 0은 포함될 수 없습니다."
        case .duplicatedDigits:
            return "입력값에 중복된 숫자가 있습니다."
        case .unknownError:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
