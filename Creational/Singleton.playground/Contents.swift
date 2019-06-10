import Foundation

class LoginManager {
    static let shared = LoginManager()
    
    private var isLogin: Bool = false
    
    private init() { }
    
    func Loginin() {
        isLogin = true
        print("Loginin: \(isLogin)")
    }
}

LoginManager.shared.Loginin()
