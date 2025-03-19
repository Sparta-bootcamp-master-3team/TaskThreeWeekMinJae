import Foundation

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
 Car 클래스에서 새로운 메서드와 프로퍼티를 추가한다면, 상속받는 ElectricCar 클래스와 HybridCar 클래스는 Car클래스에서 추가된 메서드와 프로퍼티를 오버라이딩 할 수 있습니다.
 또한 HybridCar에서는 필요하지만 ElectricCar에서는 불필요한 기능을 HybridCar에서 추가할 수 있지만, Car클래스에서 final 키워드와 함께 추가하여 오버라이딩 할 수 있습니다.
 이는 프로토콜보다 더 구체화된 메서드와 프로퍼티를 사용할 수 있고, 중복된 코드 없이 재사용할 수 있다는 장점을 갖고 있습니다.
 하지만 클래스는 한개의 클래스만 상속받을 수 있다는 단점이 있습니다. 예를들어 블루투스 기능을 추가하기 위해 BlueTooth 클래스를 작성하여 더 큰 공통분모의 클래스로 묶기 위해 여러번의 상속을 구현한다면 디버깅도 어려울 뿐만 아니라 유지보수하기 어려워질 수 있습니다. 그리고 부모클래스의 의존성이 생겨 부모클래스의 변경은 곧 하위 클래스도 모두 변경될 수 있다는 점도 있습니다.
 프로토콜을 사용하여 새로운 메서드와 프로퍼티를 추가한다면, 단일 상속 제한이 있는 클래스보다 다중 채택이 가능하므로 여러개의 프로토콜을 구성하여 채택된 클래스를 구현할 수 있습니다. 그리고 프로토콜은 클래스뿐만아니라, 구조체, 열거형에서도 채택이 가능합니다.
 다중 프로토콜을 사용한다면 기능 확장성을 열어둘 수 있고, 프로토콜의 요구사항을 구현해야하기 때문에 코드를 까먹지 않고 구현할 수 있습니다.
 단점으로 프로토콜은 하나의 청사진만 구현되므로, 채택시 직접 기능을 구현해야하는 점이 있습니다. 이는 다른 코드와 중복될 수 있는 가능성이 있습니다.
 또한 클래스는 상속시 자동으로 오버로딩이 되어 부모클래스의 메서드와 프로퍼티를 접근할 수 있지만, 프로토콜은 채택시 매번 해당 요구사항을 직접 구현해야하는 단점도 있습니다.
*/
