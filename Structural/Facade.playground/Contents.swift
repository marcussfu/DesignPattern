import Foundation

protocol Factory {
    func produce() -> String
}

class ChocolateFactory: Factory {
    func produce() -> String {
        return "chocolate"
    }
}

class CakeFactory: Factory {
    func produce() -> String {
        return "cake"
    }
}

class AccessoriesFactory: Factory {
    func produce() -> String {
        return "accessories"
    }
}

class FacadeFactory {
    lazy var chocolateFactory = ChocolateFactory()
    lazy var cakeFactory = CakeFactory()
    lazy var accessoriesFactory = AccessoriesFactory()
    
    func produceChocolateCake() {
        print("produce: \(chocolateFactory.produce()) \(cakeFactory.produce()) and \(accessoriesFactory.produce())")
    }
}

let facadeFactory = FacadeFactory()
facadeFactory.produceChocolateCake()
