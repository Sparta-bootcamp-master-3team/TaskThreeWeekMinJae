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


// MARK: 문제 3
func a(_ arr: [Int]) -> [Int] {
    var output = [Int]()
    arr.enumerated().forEach { (index, element) in
        if index % 2 == 0  { output.append(element)}
    }
    return output
}
let input3 = [1, 2, 3, 4, 5]
print(a(input3))

func b(_ arr: [String]) -> [String] {
    var output = [String]()
    arr.enumerated().forEach { (index, element) in
        if index % 2 == 0  { output.append(element)}
    }
    return output
}
let input4 = ["가", "나", "다", "라", "마"]
print(b(input4))

func c<T>(_ arr: [T]) -> [T] {
    var output = [T]()
    arr.enumerated().forEach { (index, element) in
        if index % 2 == 0  { output.append(element)}
    }
    return output
}
print(c(input3))
print(c(input4))

protocol Numbers { }
func d<T: Numbers>(_ arr: [T]) -> [T] {
    var output = [T]()
    arr.enumerated().forEach { (index, element) in
        if index % 2 == 0  { output.append(element)}
    }
    return output
}


