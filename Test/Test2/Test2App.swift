//
//  Test2App.swift
//  Test2
//
//  Created by keloopA on 2024/3/2.
//

import SwiftUI

@main
struct Test2App: App {
@State var personMananger = PersonManager(persons: DefaultPersons)
    var body: some Scene {
        WindowGroup {
            NavigationView{
                   PersonList()
            }.environmentObject(personMananger)
        }
    }
}
