import Foundation

// MARK: 문제 2
class SecondQuestion {
    
    let numbers = [1, 2, 3, 4, 5]
    var result = [String]()

    func printStringNumbers() {
        numbers.map{ result.append(String($0)) }
        print(result)
    }
//    numbers.map{ result.append(String($0)) }
//    print(result)
    
    func printEvenNumbers() {
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let output = input.filter{ $0 % 2 == 0 }.map { String($0) }
        print(output)
    }

    func myMap(arr: [Int], _ closure: (Int) -> String) -> [String] {
        arr.map{closure($0)}
    }
    
    func printArrayWithMyMap() {
        let result2 = myMap(arr: [1,2,3,4,5]) {
            String($0)
        }
        print(result2)
    }
}
