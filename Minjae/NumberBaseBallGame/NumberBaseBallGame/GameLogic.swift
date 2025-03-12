import Foundation

    // 게임 로직
final class GameLogic: BaseBallGameLogicProtocol {
        
        // 정답 생성
        func initAnswerIntegerArray() -> [Int] {
            var answerArray = [Int]()
            func randomNumber(range: Range<Int>) -> Int {
                return Int.random(in: range)
            }
            while answerArray.count < 3 {
                let num = randomNumber(range: 1..<10)
                if !answerArray.contains(num) { answerArray.append(num)}
            }
            return answerArray
        }
        
        // 입력값 검사
        func isCorrectInput(in input: String) -> Bool {
            if input.prefix(1) == "0" { return false }
            if Int(input) == nil || Set(input.map{$0}).count != 3 {
                return false
            }
            return true
        }
        
        // 숫자 비교
        func compare(input: [Int], withAnswer answer: [Int]) -> (equalPoint: Int, containsPoint: Int) {
            var equalPoint = 0
            var containsPoint = 0
            
            for i in 0..<input.count {
                if answer[i] == input[i] {
                    equalPoint += 1
                } else if answer.contains(input[i]) {
                    containsPoint += 1
                }
            }
            return (equalPoint: equalPoint, containsPoint: containsPoint)
        }
        
    }
