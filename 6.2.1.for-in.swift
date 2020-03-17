import Foundation

// Dictionary
let friends: [String: Int] = ["Jay": 35, "Joe": 29, "Jenny": 31]
for tuple in friends {
    print(tuple)
}

let 주소: [String: String] = ["도": "충청북도", "시군구": "청주시 청원구", "동읍면": "율량동"]
for (키, 값) in 주소 {
    print("\(키) : \(값)")
}

// Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", 
                            "052", "053", "054", "055", "061", "062", "063", "064"]
for 번호 in 지역번호 {
    print(번호)
}

/*
var result: Int = 1
for _ in 1...3 {
    result *= 10
}
print("10의 3제곱은 \(result) 입니다.")

let helloSwift: String = "Hello Swift!"
for char in helloSwift {
    print(char)
}

for i in 0...5 {
    if(i.isMultiple(of: 2)) {
        print(i)
        continue
    }
    print("\(i) == 홀수")
}
*/

/*
for i in 0...2 {
    print(i)
}
*/