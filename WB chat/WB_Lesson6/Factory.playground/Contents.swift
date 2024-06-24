
class Person {
    var fullName: String
    var age: Int
    var passport: Passport?

    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print(#file, #line, "Чекловек инициализирован")
    }

    deinit {
        print(#file, #line, "Человек деиницилизирован")
    }
}

class Passport {
    var seria: Int
    var number: Int
    var dateVidachi: String
    weak var person: Person?

    init(seria: Int, number: Int, dateVidachi: String, person: Person?) {
        self.seria = seria
        self.number = number
        self.dateVidachi = dateVidachi
        self.person = person
        print(#file, #line, "Паспорт инициализирован")
    }

    deinit {
        print(#file, #line, "Паспорт деиницилизирован")
    }
}

var person: Person? = Person(fullName: "Иванов Иван Иваныч", age: 31)
var passport: Passport? = Passport(seria: 6510, number: 266009, dateVidachi: "30.07.2016", person: person)
person?.passport = passport

person = nil
passport = nil
