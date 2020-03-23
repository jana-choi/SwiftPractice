func stringToInteger(_ string: String) -> Int? { return Int(string) }
func integerToString(_ integer: Int) -> String? { return "\(integer)" }

var optionalString: String? = "2"
let flattenResult = optionalString.flatMap(stringToInteger).flatMap(integerToString).flatMap(stringToInteger)
print(flattenResult)

let mappedResult = optionalString.map(stringToInteger)
print(mappedResult)

print("---------------------------------------------------")
let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map { $0 }
let compactMapped: [Int] = optionals.compactMap { $0 }

print(mapped)
print(compactMapped)

let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map { $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap { $0.flatMap{ $0 } }

print(mappedMultipleContainer)
print(flatmappedMultipleContainer)
