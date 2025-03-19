import Foundation

// MARK: 문제 1

let first = FirstQuestion()
print(first.sum(10, 20))

first.calculate { num1, num2 in
    return "\(num1 + num2)"
}


// MARK: 문제 2

let second = SecondQuestion()
second.printStringNumbers()
second.printEvenNumbers()
second.printArrayWithMyMap()


// MARK: 문제 3

let third = ThirdQuestion()
print(third.returnAFunctionResult())
print(third.returnBFunctionResult())
print(third.returnCFunctionResult())
print(third.returnDFunctionResult())





