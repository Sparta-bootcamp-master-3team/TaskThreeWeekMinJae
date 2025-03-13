//
//  RecordManager.swift
//  NumberBaseBallGame
//
//  Created by 조선우 on 3/13/25.
//

import Foundation

// 게임 기록 class
class RecordManager {
    private var recordArray = [Int]()
    
    func addRecord(count: Int) {
        recordArray.append(count)
    }
    
    func recordPlayTimes() {
        if recordArray.isEmpty {
            print("아직 시작하지 않았습니다 0️⃣")
        }
        for i in 0..<recordArray.count {
            print("\(i + 1)번째 게임: 시도 횟수 - \(recordArray[i]) 🔥")
        }
        print("")
    }
}
