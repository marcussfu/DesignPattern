# Design Patterns
## 程式語言
- Swift
## 第三方套件
### Behavioral
類別和物件如何互動，以及各自的責任

Chain Of Resposibility
--------------------------
- 用責任鏈打破討厭的switch case(if else)
- 如果case條件要做的都是一件職責，且可能增加，那透過chain of responsibility來解耦合挺適用
- 每個物件只需做好自已的事，也只知道自已該做的事
- 抽象的責任物件，只知道往下傳遞這件事(next)

Command
--------------------------
客戶端請求動作，需要呼叫不同物件處理，若把呼叫不同介面物件的方法直接寫在客戶端或繼承客戶端在子類別完成新增加的實作，易產生重覆。
Force
- 避免在客戶端產生型別有關的條件判斷式，希望以相同呼叫方式來呼叫不同介面的物件
- 不同介面的物件不實作相同的介面，不該擁有不屬於自已的介面
- 可動態配置實作請求的方式
Solution
- 將請求封裝成物件
- 定義一個Command介面，包含一個execute方法
- 讓Concrete Command實作Command介面，並在execute中撰寫呼叫物件(Receiver)
- 客戶端透過呼叫Command介面的execute方法來發出請求給不同物件

就像洛克人打贏每關boss會獲得武器晶片(Receiver)一樣，可以動態的增加，而不需要還要拿晶片回萊德博士那重新寫入到洛克人身上。
可以直接就加進來，然後在Controller(Invoker)設定要呼叫要哪個武器(Command)，再execute開啟武器或關閉武器。


