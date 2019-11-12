import Foundation

protocol BuyPlayform {
    func game()
    func chocolate()
    func dolls()
}

class Purchaser: BuyPlayform {
    var buyerName: String
    
    init(_ name: String) {
        buyerName = name
    }
    
    func game() {
        print("\(buyerName) get game")
    }
    
    func chocolate() {
        print("\(buyerName) get chocolate")
    }
    
    func dolls() {
        print("\(buyerName) get dolls")
    }
}

class Proxy: BuyPlayform {
    var purchaser: Purchaser
    
    init(_ name: String) {
        self.purchaser = Purchaser(name)
    }
    
    func game() {
        purchaser.game()
    }
    
    func chocolate() {
        purchaser.chocolate()
    }
    
    func dolls() {
        purchaser.dolls()
    }
}

let proxy = Proxy("Buyer1")
proxy.chocolate()
proxy.game()
