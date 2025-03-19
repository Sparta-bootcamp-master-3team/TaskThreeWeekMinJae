import Foundation

class ThirdQuestion {
    
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
