import Foundation

class ThirdQuestion {
    
    // Int배열의 짝수번째 원소를 제거하여 리턴
    private func a(_ arr: [Int]) -> [Int] {
        var output = [Int]()
        arr.enumerated().forEach { (index, element) in
            if index % 2 == 0  { output.append(element)}
        }
        return output
    }
    
    func returnAFunctionResult() -> [Int] {
        let input = [1, 2, 3, 4, 5]
        let result = a(input)
        return result
    }
    // String배열의 짝수번째 원소를 제거하여 리턴
    private func b(_ arr: [String]) -> [String] {
        var output = [String]()
        arr.enumerated().forEach { (index, element) in
            if index % 2 == 0  { output.append(element)}
        }
        return output
    }
    
    func returnBFunctionResult() -> [String] {
        let input = ["가", "나", "다", "라", "마"]
        return b(input)
    }
    
    // 제네릭을 활용하여 Int, String 타입 모두 파라미터로 받을 수 있도록 구현
    private func c<T>(_ arr: [T]) -> [T] {
        var output = [T]()
        arr.enumerated().forEach { (index, element) in
            if index % 2 == 0  { output.append(element)}
        }
        return output
    }
    
    func returnCFunctionResult() -> (integerArray: [Int], stringArray: [String]) {
        let input1 = [1, 2, 3, 4, 5]
        let input2 = ["가", "나", "다", "라", "마"]
        
        return (c(input1), c(input2))
    }
    
    // Numeric을 채택한 타입이 파라미터로 입력받고 리턴하는 함수
    // 인덱스의 홀수번째를 제거하고 리턴
    private func d<T: Numeric>(_ arr: [T]) -> [T] {
        var output = [T]()
        arr.enumerated().forEach { (index, element) in
            if index % 2 == 0  { output.append(element)}
        }
        return output
    }

    func returnDFunctionResult() -> (resultArray1: [Int], resultArray2: [Double]) {
        let input1: [Int] = [1, 2, 3, 4, 5]
        let input2: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        return (d(input1), d(input2))
    }
}
