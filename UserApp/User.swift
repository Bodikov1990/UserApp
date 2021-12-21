//
//  User.swift
//  UserApp
//
//  Created by Kuat Bodikov on 21.12.2021.
//

struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getUserData() -> User {
        User(
            login: "Kuat",
            password: "Genius",
            person: Person.getPerson()
        )
    }
}

struct Person {
    var name: String
    var surname: String
    var image: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person{
        Person(name: "Kuat", surname: "Bodikov", image: "photo_2021-10-25 14.30.15")
    }
    
}
