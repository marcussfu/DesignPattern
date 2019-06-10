import Foundation

//Receiver
class CutBullet {
    private var isActive: Bool
    init() {
        isActive = false
    }
    
    func swtichOff() {
        isActive = false
        print("close weapon")
    }
    
    func switchOn() {
        isActive = true
        print("open weapon")
    }
}

//Command interface
protocol Command {
    func execute()
}

//Concrete Command
class CutBulletOnCommand: Command {
    
    var cutBullet: CutBullet
    
    init(_ cutBullet: CutBullet) {
        self.cutBullet = cutBullet
    }
    
    func execute() {
        cutBullet.switchOn()
    }
}

class CutBulletOffCommand: Command {
    
    var cutBullet: CutBullet
    
    init(_ cutBullet: CutBullet) {
        self.cutBullet = cutBullet
    }
    
    func execute() {
        cutBullet.swtichOff()
    }
}

//Invoker
class WeaponController {
    private var command: Command?
    
    func setCommand(_ command: Command) {
        self.command = command
    }
    
    func actionCommand() {
        command?.execute()
    }
}

let cutBullet = CutBullet()
let cutBulletOnCommand = CutBulletOnCommand(cutBullet)
let cutBulletOffCommand = CutBulletOffCommand(cutBullet)
let weaponController = WeaponController()

weaponController.setCommand(cutBulletOffCommand)
weaponController.actionCommand()
