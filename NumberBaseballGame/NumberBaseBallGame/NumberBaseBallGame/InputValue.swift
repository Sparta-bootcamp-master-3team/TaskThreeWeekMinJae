//
//  InputValue.swift
//  NumberBaseBallGame
//
//  Created by 조선우 on 3/13/25.
//

import Foundation

// 입력값
struct InputValue {
    func getInput() -> [Int] {
        var inputInt = [Int]()
        
        while true {
            print("숫자를 입력하세요 🔢")
            guard let input = readLine(), !input.isEmpty else {
                print("올바르지 않은 입력값입니다 🤔\n")
                continue
            }
            
            inputInt = input.compactMap{ Int(String($0)) }
            
            // input의 길이가 3이 아니거나 0이 포함되면
            guard inputInt.count == 3, Set(inputInt).count == 3, inputInt[0] != 0 else {
                print("올바르지 않은 입력값입니다 🤔\n")
                continue
            }
            
            return inputInt
        }
    }
}
