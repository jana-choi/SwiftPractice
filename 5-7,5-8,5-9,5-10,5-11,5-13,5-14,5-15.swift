import Foundation

class Car {
    var modelYear: Int?
    var modelName: String?

    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}

struct SmartPhone {
    var company: String?
    var model: String?

    static func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
        return lhs.model == rhs.model
    }
}

/*
func == (lhs: Car, rhs: Car) -> Bool {
    return lhs.modelName == rhs.modelName
}

func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
    return lhs.model == rhs.model
}
*/

let myCar = Car()
myCar.modelName = "S"

let yourCar = Car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "SE"

var yourPhone = SmartPhone()
yourPhone.model = "6S"

print(myCar == yourCar)
print(myPhone == yourPhone)

infix operator *** : MultiplicationPrecedence
func *** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloJana: String = "Hello Jana"
let jana: String = "Jana"
let isContainsJana: Bool = helloJana *** jana
print(isContainsJana)

prefix operator **
prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive
print(sqrtMinusFive)

prefix func ** (value: String) -> String {
    return value + " " + value
}

let resultString: String = **"jana"
print(resultString)

prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "jana"
var isEmptyString: Bool = !stringValue
print(isEmptyString)

stringValue = ""
isEmptyString = !stringValue
print(isEmptyString)

postfix operator ^^
postfix func ^^ (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five^^
print(fivePlusTen)

let five2: Int = 5
let sqrtFivePlusTen: Int = **five2^^
print(sqrtFivePlusTen)