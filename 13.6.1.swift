let numbers: [Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in return number % 2 == 0 }
let oddNumberPredicate  = { (number: Int) -> Bool in return number % 2 == 1 }

func hasElements(in array: [Int], match predicate: (Int) -> Bool)  -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in 
        return  (array.lazy.filter { escapablePredicate($0) } .isEmpty == false)
    })
}

let hasEvenNumber: Bool = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber: Bool = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)