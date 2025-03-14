//
//  MenuInputValidator.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/12/25.
//

struct MenuInputValidator: Validatable {
    func validate(input: String) throws {
        guard let inputNumber = Int(input),
              GameMenu.allCases.map({ $0.rawValue }).contains(inputNumber) else {
            throw MenuInputValidationError.nonMenuNumber
        }
    }
}
