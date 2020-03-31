class Person {
    let name: String
    let hobby: String?

    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }

    deinit {
        print("\(name) is being deinitialized")
    }

    lazy var introduce: () -> String = { /*[unowned self] in*/ [weak self] in
        guard let person: Person = self else {
            return "원래의 참조 인스턴스가 없어졌습니다."
        }
        
        var introduction: String = "My name is \(person.name)."

        guard let hobby = person.hobby else {
            return introduction
        }

        introduction += " "
        introduction += "My hobby is \(hobby)."
        return introduction
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
print(yagom?.introduce())

var hana: Person? = Person(name: "hana", hobby: "playing guitar")
print(hana?.introduce())

hana?.introduce = yagom?.introduce ?? {" "}
print(hana?.introduce())

yagom = nil
print(hana?.introduce())