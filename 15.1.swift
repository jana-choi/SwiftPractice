let numbers: [Int] = [0, 1, 2, 3, 4]

var doubleNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

doubleNumbers = numbers.map({(number: Int) -> Int in return number * 2})
strings = numbers.map({(number: Int) -> String in return "\(number)"})

print(doubleNumbers)
print(strings)

let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [1, 3, 5, 7, 9]
let multiplyTwo: (Int) -> Int = {$0 * 2}

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
print(doubledEvenNumbers)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)
print(doubledOddNumbers)