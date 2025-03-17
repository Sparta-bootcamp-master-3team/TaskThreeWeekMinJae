//
//  RandomValue.swift
//  NumberBaseBallGame
//
//  Created by 조선우 on 3/13/25.
//

import Foundation

// 랜덤값
struct RandomValue {
    func getRandom() -> [Int] {
        var randomValues = [Int]()
        
        // 첫번째 값이 0이 되지 않게 하기 위함
        let firstValue = Int.random(in: 1...9)
        randomValues.append(firstValue)
        
        while randomValues.count < 3 {
            let value = Int.random(in: 0...9)
            if !randomValues.contains(value) {
                randomValues.append(value)
            }
        }
        
        return randomValues
    }
}
