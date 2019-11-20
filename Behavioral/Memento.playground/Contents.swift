import Foundation

protocol Memento {
    var exp: Int {get}
    var hp: Int {get}
}

class ConcreteMemento: Memento {
    var exp: Int
    var hp: Int
    
    init(_ exp: Int,_ hp: Int) {
        self.exp = exp
        self.hp = hp
    }
}

class GamePlayOriginator {
    var exp: Int
    var hp: Int
    
    init(exp: Int, hp: Int) {
        self.exp = exp
        self.hp = hp
    }
    
    func save() -> Memento {
        print("state saved to hp: \(hp), exp: \(exp)")
        return ConcreteMemento(exp, hp)
    }
    
    func restore(_ memento: Memento) {
        exp = memento.exp
        hp = memento.hp
        print("state changed to hp: \(hp), exp: \(exp)")
    }
    
    func play(exp: Int, hp: Int) {
        self.hp = self.hp + hp
        self.exp = self.exp + exp
        print("after played, state changed to hp: \(self.hp), exp: \(self.exp)")
    }
}

class GameCaretaker {
    lazy var mementos = [Memento]()
    var originator: GamePlayOriginator
    
    init(_ originator: GamePlayOriginator) {
        self.originator = originator
    }
    
    func saveMemento() {
        mementos.append(originator.save())
    }
    
    func undo() {
        guard !mementos.isEmpty else { return}
        originator.restore(mementos.removeLast())
    }
}

let originator = GamePlayOriginator(exp: 10, hp: 100)
let caretaker = GameCaretaker(originator)

caretaker.saveMemento()// save
originator.play(exp: 50, hp: -30)
caretaker.undo()// load

