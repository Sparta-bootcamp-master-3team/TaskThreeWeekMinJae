import Foundation

// 게임 컨텐츠
protocol GameStartable {
    func gameStart(currentGameIndex: Int) -> (game: Int, tryCount: Int)
}

protocol RecordOpenable {
    func openRecord(records: [(game: Int, tryCount: Int)])
}

protocol GameExitable {
    func gameExit()
}

// 숫자 야구게임의 게임컨텐츠 (시작, 기록보기, 종료)
protocol BaseBallGameContentable: AnyObject, GameStartable, RecordOpenable, GameExitable { }

// 게임 로직 프로토콜
protocol InitRandomAnswerArrayProtocol {
    func initAnswerIntegerArray() -> [Int]
}

protocol CompareArrayProtocol {
    func compare(input: [Int], withAnswer answer: [Int]) -> (equalPoint: Int, containsPoint: Int)
}

protocol CorrectInputProtocol {
    func isCorrectInput(in input: String) -> Bool
}

// 숫자 야구게임 로직 프로토콜 (정답생성, 입력값 확인, 숫자 비교)
protocol BaseBallGameLogicProtocol: AnyObject, InitRandomAnswerArrayProtocol, CorrectInputProtocol, CompareArrayProtocol { }


