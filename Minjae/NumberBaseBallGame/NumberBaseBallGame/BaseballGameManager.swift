import Foundation

// GameManager
final class BaseBallGameManager {
    
    // 현재 게임순서
    private var currentGameIndex = 1
    // 게임모드 Protocol (게임 시작, 기록보기, 종료)
    weak var gameContent: GameContentable?
    // 기록들
    private var records: [(game: Int, tryCount: Int)] = []
    
    enum Gamemode: String {
        case start = "1"
        case record = "2"
        case exit = "3"
    }
    
    // 게임 실행
    func start() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            let input = readLine()!
            
            if input == Gamemode.start.rawValue {
                guard let result = gameContent?.gameStart(currentGameIndex: currentGameIndex) else { return }
                currentGameIndex += 1
                records.append(result)
            } else if input == Gamemode.record.rawValue {
                gameContent?.openRecord(records: records)
            } else if input == Gamemode.exit.rawValue {
                gameContent?.gameExit()
                break
            } else {
                print("올바르지 않은 입력값입니다.")
            }
        }
    }
}
