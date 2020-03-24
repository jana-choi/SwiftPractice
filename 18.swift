class Person {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("[Person] age: \(oldValue) -> \(self.age)")
        }
    }

    var koreanAge: Int {
        return self.age + 1
    }

    var fullName: String {
        get {
            return self.name
        }

        set {
            self.name = newValue
        }
    }

    var introduction: String {
        return "이름 : \(name) 나이 : \(age)"
    }
}

class Student: Person {
    var grade: String = "F"

    override var age: Int {
        didSet {
            print("[Student] age: \(oldValue) -> \(self.age)")
        }
    }

    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }

    override var koreanAge: Int {
        get {
            return super.koreanAge
        }

        set {
            self.age = newValue - 1
        }

        //didSet { }
    }

    override var fullName: String {
        didSet {
            print("[Student] fullName: \(oldValue) -> \(self.fullName)")
        }
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
//yagom.koreanAge = 56
print(yagom.introduction)
print(yagom.koreanAge)

let jay: Student = Student()
jay.name = "jay"
jay.age = 14
jay.koreanAge = 15
print(jay.introduction)
jay.fullName = "Kim jay"
print(jay.koreanAge)


print("-------------------------------------------------")

class School {
    var students: [Student] = [Student]()

    subscript(number: Int) -> Student {
        print("School subscript")
        return students[number]
    }
}

class MiddleSchool: School {
    var middleStudents: [Student] = [Student]()

    override subscript(index: Int) -> Student {
        print("MiddleSchool subscript")
        return middleStudents[index]
    }
}

let university: School = School()
university.students.append(Student())
university[0]

let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Student())
middle[0]
