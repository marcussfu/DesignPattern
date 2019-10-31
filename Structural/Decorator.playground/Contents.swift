import Foundation

protocol Product {
    var cost: Double {get}
    var ingredients: [String] {get}
}

class NormalCoffee: Product {
    var cost: Double = 1.0
    var ingredients: [String] = ["water", "coffee"]
}

protocol ProductDecorator: Product {
    var wrappedProduct: Product {get}
}

class Milk: ProductDecorator {
    var wrappedProduct: Product
    
    var cost: Double {
        return wrappedProduct.cost + 0.5
    }
    
    var ingredients: [String] {
        return wrappedProduct.ingredients + ["Milk"]
    }
    
    init(_ product: Product) {
        wrappedProduct = product
    }
}

class WhippedCream: ProductDecorator {
    var wrappedProduct: Product
    
    var cost: Double {
        return wrappedProduct.cost + 1
    }
    
    var ingredients: [String] {
        return wrappedProduct.ingredients + ["WhippedCream"]
    }
    
    init(_ product: Product) {
        wrappedProduct = product
    }
}

var coffee: Product = NormalCoffee()
print("cost: \(coffee.cost), ingredients: \(coffee.ingredients)")
coffee = Milk(coffee)
print("cost: \(coffee.cost), ingredients: \(coffee.ingredients)")
coffee =  WhippedCream(coffee)
print("cost: \(coffee.cost), ingredients: \(coffee.ingredients)")
