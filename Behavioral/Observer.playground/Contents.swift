import Foundation

protocol Observer {
    var id: String { get set}
    func onValueChanged(_ message: String)
}

protocol Observerable {
    var observers: [Observer] { get set}
    func add(_ observers: Observer...)
    func remove(_ observer: Observer)
    func notify(_ message: String)
}

class Podcast: Observerable {
    var observers: [Observer] = [Observer]()
    
    func add(_ observers: Observer...) {
        for item in observers {
            self.observers.append(item)
        }
    }
    
    func remove(_ observer: Observer) {
        self.observers.removeAll{ $0.id == observer.id}
    }
    
    func notify(_ message: String) {
        for observer in observers {
            observer.onValueChanged(message)
        }
    }
}

class Library: Observer {
    var id: String = "Library"
    
    func onValueChanged(_ message: String) {
        print("Library get message: \(message)")
    }
    
}

class Store: Observer {
    var id: String = "Store"
    
    func onValueChanged(_ message: String) {
        print("Store get message: \(message)")
    }
}

let library = Library()
let store = Store()
let publisher = Podcast()
publisher.add(library, store)
publisher.notify("clean")
publisher.remove(store)
publisher.notify("look the girl")


