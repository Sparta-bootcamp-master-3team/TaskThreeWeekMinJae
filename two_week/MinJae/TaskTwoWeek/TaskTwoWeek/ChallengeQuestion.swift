import Foundation

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

/*
 class의 상속을 사용하여 기능을 추가할 때 부모 클래스에서 새로운 메서드나 프로퍼티를 추가한다면, 부모 클래스를 상속하는 클래스에서도 해당 메서드나 프로퍼티를 접근 및 사용할 수 있습니다.
 이는 프로토콜보다 더 구체화된 청사진을 제공하는 장점을 갖고 있습니다.
 예를 들어, Car클래스에서 기름연료에 관한 메서드를 추가한다면, Car을 상속하는 HybridCar 클래스에는 사용될 수 있지만, ElectricCar 클래스에는 불필요합니다.
 
*/
