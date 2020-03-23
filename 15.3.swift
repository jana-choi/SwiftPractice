let numbers: [Int] = [1, 2, 3]
let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

print("----- Version 3 -----")

let numbers0: [Int] = [1, 2, 3, 4, 5, 6, 7]
var result: Int = numbers0.filter{ $0.isMultiple(of: 2) }.map{$0 * 3}.reduce(0){ $0 + $1 }
print(result)

result = 0
for number in numbers0 {
    guard number.isMultiple(of: 2) else {
        continue
    }
    result += number * 3
}
print(result)


print("----- Version 2 -----")

var upperCasedNames: [String]
upperCasedNames = names.reduce(into: [], { $0.append($1.uppercased()) })
print(upperCasedNames)

upperCasedNames = names.map { $0.uppercased() }
print(upperCasedNames)

var doubleNumbers: [Int] = numbers.reduce(into: [1, 2]) { (result: inout [Int], next: Int) in
                                                            print("result: \(result) next: \(next)")
                                                            guard next % 2 == 0 else {
                                                                return
                                                            }
                                                            print("\(result) append \(next)")
                                                            result.append(next * 2)
                                                        }
print(doubleNumbers)

doubleNumbers = [1, 2] + numbers.filter { $0.isMultiple(of: 2) }.map { $0 * 2 }
print(doubleNumbers)

var sum2 = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
                                    print("\(result) + \(next)")
                                    result += next })
print(sum2)

var subtractFromThree2 = numbers.reduce(into: 3, { print("\($0) - \($1)")
                                                    $0 -= $1 })
print(subtractFromThree2)


print("----- Version 1 -----")

let reducedNames: String = names.reduce("yagom's friend: ") { return $0 + ", " + $1 }
print(reducedNames)

var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
                                print("\(result) + \(next)")
                                return result + next })
print(sum)

var subtract: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
                                print("\(result) - \(next)")
                                return result - next })
print(subtract)

let sumFromThree: Int = numbers.reduce(3) { print("\($0) + \($1)")
                                            return $0 + $1 }
print(sumFromThree)

let subtractFromThree: Int = numbers.reduce(3) { print("\($0) - \($1)")
                                            return $0 - $1 }
print(subtractFromThree)
