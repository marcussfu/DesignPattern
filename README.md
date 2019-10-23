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

Interpreter
--------------------------
Implementing an expression interface which tells to interpret a particular context.

- 把一句有特殊規則的語句，透過解譯器將它真正的意思表現出來
- context: 待解譯的語句
- Abstract Expression: 所有規則都要實作的介面
- Terminal Expression: 無法再展開的規則，最小單位規則
- Nonterminal Expression: 可以再展開的規則，可展開成NonterminalExpression和TerminalExpression的組合
- 每個語法規則都說計相對應的類別，方便實踐語法以便容易改變或擴充語法
- 缺點是語法規則變多變複雜時，類別也會變多(可用剖析器和編譯器替代)

Strategy
--------------------------
用可互換的(Interchangeable)介面來替換某個實體中的方法，可以經由替換不同的策略使物件擁有不同的行為。
在實現Strategy模式時，目標是定義一個無需修改或繼承的環境類。


### Creational
物件實體化

Singleton
--------------------------
- 只能有一個唯一實體的物件，例如負責處理使用者登入的物件
- Initialize your class instance single time only with static property and it will share your class instance globally.
- Swift example: UserDefaults.standard, FileManager.default
- lazy var
- 缺點: If using more singleton patter inside your project, it's hard to manage the lifecyle of your singleton  class.
- 在多執行緒下執行可能有同時創建的狀況
- solution1: 同步化shared，但會降低程式執行效率
- solution2: 不用lazy var的方式，先建立好
- solution3: 雙重檢查上鎖，檢查instance是否已經建立，沒建立才進行同步化

Factory
--------------------------
定義一個用於建立物品的介面，讓子類決定實體化哪一個類別。Factory 方法使一個類別的實例化延遲到其子類別，而不需了解具體的實例化細節。

Prototype
--------------------------
通過複製已有的對象來創建新的對象，不需了解建立的細節，不是透過new，而是clone來取得所需的物件。
為何要用prototype來clone? 因為有時候建立新物件的代價很高，例如建立物件需要讀取遠端資料庫，這樣會很花時間。




