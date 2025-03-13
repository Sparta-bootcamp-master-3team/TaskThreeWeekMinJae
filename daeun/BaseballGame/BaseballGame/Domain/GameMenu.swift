//
//  GameMenu.swift
//  BaseballGame
//
//  Created by 곽다은 on 3/12/25.
//

enum GameMenu: Int, CaseIterable {
    case start = 1
    case log
    case end
    
    var description: String {
        switch self {
        case .start:
            return "게임 시작하기"
        case .log:
            return "게임 기록 보기"
        case .end:
            return "종료하기"
        }
    }
}
