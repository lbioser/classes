//
//  Person.swift
//  Test2
//
//  Created by keloopA on 2024/3/2.
//

import Foundation
import SwiftUI

class PersonManager:ObservableObject {
  @Published  var persons: [Person]
    
    init(persons: [Person]) {
        self.persons = persons
    }
    
    
    func sortPersonWithAgePhase(phase:AgePhase) -> Binding<[Person]>{
        var ps = [Person]()
      return Binding {
            switch phase {
            case .Child:
                ps = self.persons.filter { $0.age < 18}
            case .Young:
                ps = self.persons.filter { $0.age < 45 && $0.age >= 18}
            default:
                ps = self.persons.filter { $0.age >= 45 }
            }
          return ps.sorted { $0.name < $1.name }
        } set: { ps in
            for p in ps {
                if let index = self.persons.firstIndex(where: { $0.age == p.age }) {
                    self.persons[index] = p
                }
            }
        }

       
        
    }
    
    enum AgePhase:String, CaseIterable {
        case Child
        case Young
        case Old
    }
    
    func addPerson(p:Person) {
        persons.append(p)
    }
    
    func update(p:Person) {
        
        if let index = persons.firstIndex(of: p){
            persons[index] = p
        }
       
    }
}

struct Person:Hashable {
    var name: String
    var age: Int
    var story: String = ""
    
}

let DefaultPersons:[Person] = {
    var persons = [Person]()
    for i in 0...100 {
        persons.append(Person(name: String("qwertyuiop".randomElement()!), age: i))
    }
    return persons
}()

