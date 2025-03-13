//
//  HintCompare.swift
//  NumberBaseBallGame
//
//  Created by 조선우 on 3/13/25.
//

import Foundation

class HintCompare {
    // 랜덤값과 사용자 값을 비교하는 메서드
    func compare(answer: [Int], input: [Int]) -> Bool {
        var strike = 0
        var ball = 0

        for index in 0..<input.count {
            if answer[index] == input[index] {
                strike += 1
            } else if answer.contains(input[index]) {
                ball += 1
            }
        }

        if strike == 3 {
            print("정답 ✅")
            return true // 종료
        } else if strike > 0 || ball > 0 {
            print("\(strike)스트라이크🏏 \(ball)볼⚾️")
        } else {
            print("Nothing ❌")
        }

        return false // 다시
    }
}
