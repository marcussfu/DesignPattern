import Foundation

// Component
protocol Solider {
    var name: String { get}
    
    func attack(_ direction: String)
}

// Leafs
class Infantry: Solider {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func attack(_ direction: String) {
        print("\(name) attack to \(direction)")
    }
}

class Cavalry: Solider {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func attack(_ direction: String) {
        print("\(name) attack to \(direction)")
    }
}

// Composite
class General: Solider {
    var name: String
    lazy var soliders = [Solider]()
    
    init(_ name: String) {
        self.name = name
    }
    
    func attack(_ direction: String) {
        for solider in soliders {
            solider.attack(direction)
        }
    }
    
    func add(solider: Solider) {
        if !soliders.contains(where: { $0.name == solider.name }) {
            soliders.append(solider)
        }
    }
    
    func remove(solider: Solider) {
        guard let index = soliders.firstIndex(where: { $0.name == solider.name }) else {
            return
        }
        soliders.remove(at: index)
    }
}

let infantry1 = Infantry("Infantry1")
let infantry2 = Infantry("Infantry2")
let cavalry1 = Cavalry("cavalry1")
let cavalry2 = Cavalry("cavalry2")
let general = General("Caeser")

infantry1.attack("right")
infantry2.attack("right")
cavalry1.attack("left")
cavalry2.attack("left")
print()
general.add(solider: infantry1)
general.add(solider: cavalry2)
general.attack("forward")
print()
general.remove(solider: cavalry2)
general.attack("backward")
