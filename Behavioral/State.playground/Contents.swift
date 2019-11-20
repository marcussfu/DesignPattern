import Foundation

protocol State {
    func action()
}

class RunState: State {
    func action() {
        print("Leg move fast!")
    }
}

class SitState: State {
    func action() {
        print("Sitting cross-legged")
    }
}

class WalkState: State {
    func action() {
        print("Legs move normal speed")
    }
}

class BodyAction {
    lazy var state: State = SitState()
    
    func setState(_ state: State) {
        self.state = state
    }
    
    func move() {
        state.action()
    }
}

let userBodyAction = BodyAction()
userBodyAction.move()
userBodyAction.setState(WalkState())
userBodyAction.move()
userBodyAction.setState(RunState())
userBodyAction.move()
