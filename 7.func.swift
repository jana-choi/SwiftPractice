import Foundation

func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

//crashAndBurn()

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
//someFunction(isAllIsWell: false)

typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }

    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1;
    }

    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4
let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}


typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a:Int, _ b:Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2, 5))

mathFunction = multiplyTwoInts
print(mathFunction(2, 5))

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

func chooseMathFunction(_ toAdd: Bool) ->CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)