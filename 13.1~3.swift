let names1: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
    //print("\(first) \(second) 비교중")
    return first > second
}

let reserved1: [String] = names1.sorted(by: backwards)
print(reserved1)

let names2: [String] = ["wizplan", "eric", "yagom", "jenny"]
let reserved2: [String] = names2.sorted(by: {(first: String, second: String) -> Bool in return first > second})
print(reserved2)

let names3: [String] = ["wizplan", "eric", "yagom", "jenny"]
let reserved3: [String] = names3.sorted() {(first: String, second: String) -> Bool in return first > second}
print(reserved3)

let names4: [String] = ["wizplan", "eric", "yagom", "jenny"]
let reserved4: [String] = names4.sorted {(first: String, second: String) -> Bool in return first > second}
print(reserved4)

let names5: [String] = ["wizplan", "eric", "yagom", "jenny"]
let reserved5: [String] = names5.sorted {(first, second)  in return first > second}
print(reserved5)

let names6: [String] = ["wizplan", "eric", "yagom", "jenny"]
let reserved6: [String] = names6.sorted {/*return*/ $0 > $1}
print(reserved6)

let names7: [String] = ["wizplan", "eric", "yagom", "jenny"]
let reserved7: [String] = names7.sorted(by: >)
print(reserved7)