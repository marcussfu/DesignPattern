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

Observer
--------------------------
一種一對多的依賴關係，當物件的狀態改變，所有依賴於它的物件都會得到通知並被自動更新。
很適合用於介面相關的操作。
優點: 允許發送者在不了解接受者如何處理通知下，以一種統一的方式發送通知。
缺點: 發送通知的對象和接受通知的對象產生依賴。

State
--------------------------
一個物件的行為會因為物件自身狀態不同而表現出不同的反應動作，一般會把與狀態相關的程式寫在物件內以依據狀態改變行為(switch，if else)，但除了使程式碼容易重覆太長不好理解修改，狀態太多也會不易測試。

Solution: 抽離與狀態相關的行為，設計一個State介面，針對每一個狀態新增一個實作介面的Concrete(具體) State物件，與該狀態相關的行為移到相對應的Concrete State物件中。

讓物件擁有一個指向State介面的成員變數，藉由改變State成員變數所指向的Concrete State物件來改變原始物件的行為。

Memento
--------------------------
在不破壞封裝性的前提下，捕獲一個物件的內部狀態，並在該物件之外保存這個狀態，這樣以後就可將該物件恢復到原先保存的狀態，提供備份功能的概念。

記錄某一時間點的State，像 Save & Load或上一步下一步。

Originator: 提供建立Memento( Save)或恢復到某個Memento狀態( Restore)的方法，也是主要改動State的類。
Memento: 負責儲存需要儲存的State的類( Init Data)，就是記錄某一時間點的State。
Caretaker: 負責保存備忘錄的類別( [Memento]())，需要新增或回調State時，由此類來控制Originator類。


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

Builder
--------------------------
在創建類時，有時需要帶參數進建構子，但會因應狀況不同，產生不同參數的建構子，如此一來就需要設定各種狀況的建構子有哪些，才能知道要選哪個，這樣會造成程式碼重複嚴重。
Builder提供一個彈性的解決方案，用oop處理不同物件的創造，目的是為了要分離一個複雜對象的建構和表現建造的方式，使得同樣的建構過程可以產生出不同的表現。
隱藏產生複雜物件的過程，且允許物件用多個步驟建立(和Factory Method只有一個生成步驟不同)，因此經常用來建立合成結構。

缺點: 對使用者而言，需要知道有什麼setxxx的方法，才能建立出想要的物件。


### Structural
如何設計物件之間靜態結構，繼承，實現與依賴關係。

Decorator
--------------------------
在不想或無法修改類別的時候，可以選擇性的修改對象的行為。
把類別中的核心功能和其他功能區分開。
減少繼承，互相繼承或互相影響(降低耦合)。

Trap: Extension，Decorator特徵是選擇性的應用到單個對象，但extension則是修改所有某個類型的對象。

Adapter
--------------------------
將一個類別的介面，轉換成另一個介面供客戶使用，轉換器讓原本介面不相容的類別可以合作。
ex: 螢幕HDMI to VGA 傳輸轉接線
轉接的介面(Target)，介面的實作(Adapter)，提供的類別(Adaptee)

Adapter有物件和繼承兩種

Proxy
--------------------------
 為其他物件提供一種代理以控制對這個物件的存取。
When  to use?
 存取權利需要控制時
 存取時需要提供其他的功能時
 ex: 代購
 
 Facade
 --------------------------
 The Facade pattern is used to define a simplified interface to a more complex subsystem.
 
 為子系統中的一組介面提供一個一致的介面，此模式定義了一個高階介面，這個介面使得這一個子系統更加容易使用。
 客戶端只要統一從Facade這個介面就可以不用管背後的邏輯，一種整理性的模式，弈可以把外觀模式當作重構的起點。


