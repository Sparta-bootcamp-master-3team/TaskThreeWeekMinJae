//
//  MenuInputValidationError.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/12/25.
//

enum MenuInputValidationError: Error {
    case nonMenuNumber
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .nonMenuNumber:
            return "올바른 숫자를 입력해주세요!"
        case .unknownError:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
