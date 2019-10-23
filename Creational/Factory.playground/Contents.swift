import Foundation

protocol ProductProtocol {
    var describe: String {get}
}

class AProduct: ProductProtocol {
    var describe: String {
        return "Aproduct"
    }
}

class BProduct: ProductProtocol {
    var describe: String {
        return "Bproduct"
    }
}

enum Product {
    case AProduct
    case BProduct
}

enum currencyFactory {
    static func currency(for product: Product) -> ProductProtocol {
        switch product {
        case .AProduct:
            return AProduct()
        case .BProduct:
            return BProduct()
        }
    }
}

currencyFactory.currency(for: .AProduct).describe
currencyFactory.currency(for: .BProduct).describe
