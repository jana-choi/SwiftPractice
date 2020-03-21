class Account {
    var credit: Int = 0 {
        willSet { print("[credit willSet] 잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.") }
        didSet  { print("[credit didSet] 잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.") }
    }

    var dallarValue: Double {
        get { return Double(credit) / 1000.0 }
        set {
            credit = Int(newValue * 1000)
            print("[dallarValue set] 잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account {
    override var dallarValue: Double {
        willSet { print("[dallarValue willSet] 잔액이 \(dallarValue)달러에서 \(newValue)달러로 변경될 예정입니다.") }
        didSet  { print("[dallarValue didSet] 잔액이 \(oldValue)달러에서 \(dallarValue)달러로 변경되었습니다.") }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
myAccount.credit = 1000
myAccount.dallarValue = 2


// let myAccount: Account = Account()
// myAccount.credit = 1000