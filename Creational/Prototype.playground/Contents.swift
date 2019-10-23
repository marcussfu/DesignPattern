import Foundation

class Worker {
    let name: String
    var health: Int = 100
    
    init(name: String) {
        self.name = name
    }
    
    func clone() -> Worker {
        return Worker(name: name)
    }
}

let worker = Worker(name: "GG")
var worker2 = worker.clone()
worker2.health = 50

print("worker.health: ", worker.health)
print("worker2.health: ", worker2.health)
