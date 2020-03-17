import Foundation

enum Menu {
    case chicken
    case pizza
    case hamburger
}

let lunchMenu: Menu = .chicken
switch lunchMenu {
    case .chicken:
        print("반반 무많이")
    case .pizza:
        print("핫소스 많이 주세요.")
    @unknown case _:
        print("오늘 메뉴가 뭐죠?")
}

let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
    case "사원" where 인턴인가 == true:
        print("인턴입니다.")
    case "사원" where 연차 < 2 && 인턴인가 == false:
        print("신입사원입니다.")
    case "사원" where 연차 > 5:
        print("연식이 좀 된 사원입니다.")
    case "사원":
        print("사원입니다.")
    case "대리":
        print("대리입니다.")
    default:
        print("사장입니까?")
}

let intergerValue: Int = 5
switch intergerValue {
    case 0:
        print("Value == zero")
    case 1...10:
        print("Value == 1~10")
        fallthrough
    case Int.min..<0, 101..<Int.max:
        print("Value < 0 or Value > 100")
        break
    default:
        print("10 < Value <= 100")
}

let stringValue: String = "Liam Neeson"
switch stringValue {
    case "yagom":
        print("He is yagom")
    case "Jay":
        print("He is Jay")
    case "Jenny", "Joker", "Nova":
        print("He or She is \(stringValue)")
    default:
        print("\(stringValue) said 'I dont't know who you are'")
}

typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("jana", 20)
switch tupleValue {
    case ("jana", 50):
        print("정확히 맞췄습니다!")
    case ("jana", let age):
        print("이름만 맞았습니다. 나이는 \(age) 입니다.")
    case (let name, 99):
        print("나이만 맞았습니다. 이름은 \(name) 입니다.")
    default:
        print("누굴 찾나요?")
}