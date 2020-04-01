enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 4)
    ]

    var coinsDeposited = 0

    func dispense(snack: String) { print("\(snack) 제공") }

    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }

        self.coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem

        self.dispense(snack: name)
    }
}

let favoriteSnacks = [
    "yagom": "Chips",
    "jinsung": "Biscuit",
    "heejin": "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) /*throws*/ {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    //try vendingMachine.vend(itemNamed: snackName)
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) /*throws*/ {
        //try vendingMachine.vend(itemNamed: name)
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coinsNeed) {
        print("자금 부족 - 동전 \(coinsNeed) 개를 추가로 지급해주세요.")
    } catch {
        print("그 외 오류 발생: ", error)
    }
}



let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 20

var purchase: PurchasedSnack =  /*try*/ PurchasedSnack(name: "Biscuit", vendingMachine: machine)
print(purchase.name)

purchase = PurchasedSnack(name: "Ice Cream", vendingMachine: machine)
print(purchase.name)

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    /*try*/ buyFavoriteSnack(person: person, vendingMachine: machine)
}