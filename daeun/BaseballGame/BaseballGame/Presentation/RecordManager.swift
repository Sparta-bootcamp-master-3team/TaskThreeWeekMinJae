//
//  RecordManager.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/12/25.
//

final class RecordManager {
    private var records: [Int]
    
    init() {
        self.records = []
    }
    
    func addRecord(newRecord: Int) {
        records.append(newRecord)
    }
    
    func showLog() {
        print("< 게임 기록 보기 >")
        
        guard !records.isEmpty else { print("게임 기록이 없습니다!"); return }
        
        for i in 0..<records.count {
            print("\(i + 1)번째 게임 : 시도 횟수 - \(records[i])")
        }
    }
}
