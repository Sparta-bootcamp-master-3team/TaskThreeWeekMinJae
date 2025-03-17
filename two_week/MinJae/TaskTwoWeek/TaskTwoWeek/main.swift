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



// MARK: 도전 문제 1
class EngineClass { }
class ElectricEngineClass: EngineClass { }
class HydrogenEngineClass: EngineClass { }
class CarClass {
    var brand: String
    var model: String
    var year: String
    var engine: EngineClass
    
    init(brand: String, model: String, year: String, engine: EngineClass) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = engine
    }
    
    func drive() {
        print("Car 주행 중")
    }
    
    func stop() {
        print("정지")
    }
    
    func charge() {
        print("충전 중")
    }
    
    func refuel() {
        print("주유 중")
    }
}

class ElectricCarClass: CarClass { }
class HybridCarClass: CarClass {
    func switchEngine(to engine: EngineClass) {
        self.engine = engine
    }
}
let ec = ElectricCarClass(brand: "hi", model: "hi", year: "hi", engine: ElectricEngineClass())
var hc = HybridCarClass(brand: "hi", model: "hi", year: "hi", engine: HydrogenEngineClass())
print(hc.engine)
hc.switchEngine(to: ElectricEngineClass())
print(hc.engine)

protocol EngineProtocol { }
protocol ElectricEngineProtocol: EngineProtocol { }
protocol HydrogenEngineProtocol: EngineProtocol { }

protocol CarProtocol {
    var brand: String { get set }
    var model: String { get set }
    var year: String { get set }
    var engine: EngineProtocol { get set }
}

protocol ElectricCarProtocol: CarProtocol { }
protocol HybridCarProtocol: CarProtocol {
    func switchEngine(to Engine: EngineProtocol)
}

class MinjaeCar: HybridCarProtocol {
    func switchEngine(to Engine: EngineProtocol) {
        self.engine = Engine
    }
    
    var brand: String
    var model: String
    var year: String
    var engine: EngineProtocol
    
    init(brand: String, model: String, year: String, engine: EngineProtocol) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = engine
    }
}

class MinjaeCarEngine: HydrogenEngineProtocol { }
var minjaeCar = MinjaeCar(brand: "kia", model: "model", year: "2025", engine: MinjaeCarEngine())
print(minjaeCar.engine)
