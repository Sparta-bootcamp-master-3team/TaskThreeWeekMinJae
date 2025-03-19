import Foundation

// MARK: 문제 1
class FirstQuestion {
    var sum: ((Int, Int) -> String) = { (num1: Int, num2: Int) in
        return "두 수의 합은 \(num1 + num2)입니다."
    }

    func calculate(_ closure: (Int, Int) -> String ) {
        print(closure(10, 20))
    }

}

