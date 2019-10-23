import Foundation

protocol Strategy {
    func calculate(_ a: Int, _ b: Int) -> Int
}

class Add: Strategy {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

class Minus: Strategy {
    func calculate(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
}

class calculator {
    private var strategy: Strategy
    
    init(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func calculate(_ a: Int, _ b: Int) -> Int {
        return strategy.calculate(a, b)
    }
    
}

calculator(Add()).calculate(1,1)
calculator(Minus()).calculate(2,1)
