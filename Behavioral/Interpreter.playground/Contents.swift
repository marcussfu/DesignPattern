import Foundation

class Context {
    private var mContext: String
    
    init(_ mContext: String) {
        self.mContext = mContext
    }
    
    func getContext() -> String {
        return mContext
    }
}

protocol Expression {
    func interpret(_ context: Context) -> String
}

class CaptialFirstLetterExpression: Expression {
    func interpret(_ context: Context) -> String {
        let contextString = context.getContext()
        let index = contextString.index(after: contextString.startIndex)
        let range = index..<contextString.endIndex
        let integerValue = Int(contextString[range]) ?? 0
        return "\(contextString.prefix(1))\(integerValue / 2)"
    }
}

class LowerCaseFirstLetterExpression: Expression {
    func interpret(_ context: Context) -> String {
        let contextString = context.getContext()
        let index = contextString.index(after: contextString.startIndex)
        let range = index..<contextString.endIndex
        let integerValue = Int(contextString[range]) ?? 0
        return "\(contextString.prefix(1))\(integerValue * 2)"
    }
}

let captialContext = Context("A468")
let lowerCaseContext = Context("g123")

let captialFirstLetterExpression = CaptialFirstLetterExpression()
let lowerCaseFirstLetterExpression = LowerCaseFirstLetterExpression()

print(captialFirstLetterExpression.interpret(captialContext))
print(lowerCaseFirstLetterExpression.interpret(lowerCaseContext))
