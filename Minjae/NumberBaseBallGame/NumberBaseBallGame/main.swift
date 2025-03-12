import Foundation

// 게임모드 (시작, 기록보기, 종료)
protocol GameContentable: AnyObject {
    func gameStart(currentGameIndex: Int) -> (game: Int, tryCount: Int)
    func openRecord(records: [(game: Int, tryCount: Int)])
    func gameExit()
}

// 게임의 전반적인 로직 (정답생성, 입력값 확인, 숫자 비교)
protocol GameLogicProtocol: AnyObject {
    func initAnswerIntegerArray() -> [Int]
    func isCorrectInput(in input: String) -> Bool
    func compare(input: [Int], withAnswer answer: [Int]) -> (equalPoint: Int, containsPoint: Int)
}
