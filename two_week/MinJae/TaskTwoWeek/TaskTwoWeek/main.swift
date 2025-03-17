import Foundation

// MARK: 문제 1
var sum: ((Int, Int) -> String) = { (num1: Int, num2: Int) in
    return "두 수의 합은 \(num1 + num2)입니다."
}
print(sum(10, 20))

func calculate(_ closure: (Int, Int) -> String ) { }

calculate { num1, num2 in
    return "\(num1 + num2)"
}


// MARK: 문제 2
let numbers = [1, 2, 3, 4, 5]
var result = [String]()

numbers.map{ result.append(String($0)) }
print(result)

let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let output = input.filter{ $0 % 2 == 0 }.map { String($0) }

print(output)

func myMap(arr: [Int], _ closure: (Int) -> String) -> [String] {
    arr.map{closure($0)}
}
let result2 = myMap(arr: [1,2,3,4,5]) {
    String($0)
}
print(result2)
