import Foundation

enum day: String {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursnday
    case friday
    case saturday
    
    var word: String {
        switch self {
        case .sunday: return "日"
        case .monday: return "一"
        case .tuesday: return "二"
        case .wednesday: return "三"
        case .thursnday: return "四"
        case .friday: return "五"
        case .saturday: return  "六"
        }
    }
}

protocol CommonHandler {
    func getDate(_ dayWord : String)
    func myAction(_ day: day)
}

class DateClass: CommonHandler {
    
    var nextHandler: CommonHandler?
    var nowDay: day
    
    init(nextHandler: CommonHandler?, day: day) {
        self.nextHandler = nextHandler
        nowDay = day
    }
    
    func getDate(_ dayWord : String) {
        
        if dayWord == nowDay.word {
            myAction(nowDay)
        }
        else {
            guard let nextHandler = self.nextHandler else {
                print("不是日期")
                return
            }
            nextHandler.getDate(dayWord)
        }
    }
    
    func myAction(_ day: day) {
        print("今天是星期\(day.word)")
    }
}

let saturdayClass = DateClass(nextHandler: nil, day: .saturday)
let fridayClass = DateClass(nextHandler: saturdayClass, day: .friday)
let thursndayClass = DateClass(nextHandler: fridayClass, day: .thursnday)
let wednesdayClass = DateClass(nextHandler: thursndayClass, day: .wednesday)
let tuesdayClass = DateClass(nextHandler: wednesdayClass, day: .tuesday)
let mondayClass = DateClass(nextHandler: tuesdayClass, day: .monday)
let sundayClass = DateClass(nextHandler: mondayClass, day: .sunday)

sundayClass.getDate(day.wednesday.word)



