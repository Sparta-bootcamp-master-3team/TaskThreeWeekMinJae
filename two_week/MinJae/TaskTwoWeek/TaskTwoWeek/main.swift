import Foundation

// MARK: 문제 1
//var str: ((Int, Int) -> String) =

var sum: ((Int, Int) -> String) = { (num1: Int, num2: Int) in
    return "두 수의 합은 \(num1 + num2)입니다."
}
print(sum(10, 20))

func calculate(_ closure: (Int, Int) -> String ) { }

calculate { num1, num2 in
    return "\(num1 + num2)"
}

