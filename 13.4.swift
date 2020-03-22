func makeIncrement(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrement(forIncrement: 2)

let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

print(first)
print(second)
print(third)