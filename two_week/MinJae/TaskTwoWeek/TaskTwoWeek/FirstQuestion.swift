import Foundation

// MARK: 문제 1
class FirstQuestion {
    // (Int, Int) -> String 타입의 클로저 생성
    var sum: ((Int, Int) -> String) = { (num1: Int, num2: Int) in
        return "두 수의 합은 \(num1 + num2)입니다."
    }
    
    // sum과 동일 타입의 클로저를 파라미터로 받는 함수 생성
    func calculate(_ closure: (Int, Int) -> String ) {
        print(closure(10, 20))
    }

}

