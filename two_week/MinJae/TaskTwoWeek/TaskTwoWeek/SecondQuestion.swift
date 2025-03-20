import Foundation

// MARK: 문제 2
class SecondQuestion {
    
    let numbers = [1, 2, 3, 4, 5]
    var result = [String]()

    // map함수를 활용하여 numbers의 원소를 형변환하여 result에 저장
    func printStringNumbers() {
        numbers.map{ result.append(String($0)) }
        print(result)
    }
    
    // 고차함수를 체이닝하여 짝수인 원소를 형변환하여 리턴
    func printEvenNumbers() {
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let output = input.filter{ $0 % 2 == 0 }.map { String($0) }
        print(output)
    }

    // 커스텀 myMap
    func myMap(arr: [Int], _ closure: (Int) -> String) -> [String] {
        arr.map{closure($0)}
    }
    
    // myMap을 사용하여 형변환한 값을 출력
    func printArrayWithMyMap() {
        let result2 = myMap(arr: [1,2,3,4,5]) {
            String($0)
        }
        print(result2)
    }
}
