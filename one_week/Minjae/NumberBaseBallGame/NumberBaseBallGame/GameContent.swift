import Foundation

// 게임 컨텐츠 클래스
final class GameContent: BaseBallGameContentable {
    
    // 게임 로직 Protocol
    weak var delegate: BaseBallGameLogicProtocol?
    
    // 기록 보기
    func openRecord(records: [(game: Int, tryCount: Int)]) {
        if records.isEmpty { print("게임 기록이 없습니다.")}
        records.forEach { (game, count) in
            print("\(game)번째 게임 : 시도 횟수 - \(count)\n")
        }
    }
    
    // 게임 실행
    func gameStart(currentGameIndex: Int) -> (game: Int, tryCount: Int) {
        var currentTryCount = 0
        guard let answer = delegate?.initAnswerIntegerArray() else { return (game: 0, tryCount: 0) }
        
        while true {
            print("숫자를 입력하세요")
            guard let input = readLine() else { continue }
            
            guard let isCorrect = delegate?.isCorrectInput(in: input),
                  isCorrect
            else {
                print("올바르지 않은 입력값입니다.\n")
                continue
            }
            currentTryCount += 1
            let inputIntegerArray = input.map{Int(String($0))!}
            guard let result = delegate?.compare(input: inputIntegerArray, withAnswer: answer) else { break }
            
            if result.equalPoint == 3 {
                print("정답입니다!")
                return (game: currentGameIndex, tryCount: currentTryCount)
            } else if result.equalPoint == 0 && result.containsPoint == 0 {
                print("Nothing")
            } else {
                print("\(result.equalPoint) Strike  \(result.containsPoint) Ball")
            }
        }
        return (game: 0, tryCount: 0)
    }
    
    // 게임 종료
    func gameExit() {
        print("게임 종료")
    }
}
