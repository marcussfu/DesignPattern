import Foundation

enum SoldierType {
    case Infantry
    case Archer
    case Cavalry
}

protocol SoldierFlyweight {
    var type: SoldierType {get}// shared data
    func render(_ x: Int, _ y: Int)// x,y not shared data
}

// Shared Object
class ConcreteSoldierFlyweight: SoldierFlyweight {
    var type: SoldierType
    
    init(_ type: SoldierType) {
        self.type = type
    }
    
    func render(_ x: Int, _ y: Int) {
        print("\(type) at (\(x), \(y))")
    }
}

// Flyweight Factory
class SoldierFlyweightFactory {
    lazy var soldierFlyweights: [SoldierType: SoldierFlyweight] = [:]
    
    func getSoldierFlyweight(_ type: SoldierType) -> SoldierFlyweight {
        if soldierFlyweights.index(forKey: type) == nil {
            soldierFlyweights[type] = ConcreteSoldierFlyweight(type)
        }
        return soldierFlyweights[type] ?? ConcreteSoldierFlyweight(type)
    }
    
    func getSoldierFlyweightCount() -> Int {
        return soldierFlyweights.count
    }
}

let soldierFlyweightFactory = SoldierFlyweightFactory()
var infantry =  soldierFlyweightFactory.getSoldierFlyweight(.Infantry)
infantry.render(1, 1)
var cavalry =  soldierFlyweightFactory.getSoldierFlyweight(.Cavalry)
cavalry.render(2, 3)
var archer =  soldierFlyweightFactory.getSoldierFlyweight(.Archer)
archer.render(4, 4)
var archer1 =  soldierFlyweightFactory.getSoldierFlyweight(.Archer)
archer.render(5, 6)
var infantry1 =  soldierFlyweightFactory.getSoldierFlyweight(.Infantry)
infantry.render(2, 1)

print("SoldierFlyweight count: \(soldierFlyweightFactory.getSoldierFlyweightCount())")


