import Foundation

protocol Tiger {
    func shout()
}

class Cat {
    func meow() {
        print("cat meow")
    }
}

class TigerAdapter: Tiger {
    var cat: Cat
    
    init(_ cat: Cat) {
        self.cat = cat
    }
    
    func shout() {
        cat.meow()
        print("like to shout")
    }
}

let cat = Cat()
let tiger = TigerAdapter(cat)
tiger.shout()
