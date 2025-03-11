//
//  BaseBallGame.swift
//  BaseBallGame
//
//  Created by 송규섭 on 3/11/25.
//

import Foundation

struct BaseBallGame {
    func start() {
        let answer = makeAnswer()
        
        print(answer)
    }
    
    func makeAnswer() -> Int {
        while true {
            let answer = Int.random(in: 100...999)
            
            let hundredsNum = answer / 100
            let tensNum = (answer - (hundredsNum * 100)) / 10
            let oneNum = (answer - (hundredsNum * 100)) % 10
            
            guard (hundredsNum != tensNum) && (tensNum != oneNum) && (hundredsNum != oneNum) else {
                continue
            }
            
            return answer
        }
    }
}
