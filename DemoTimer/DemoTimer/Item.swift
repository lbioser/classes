//
//  Item.swift
//  DemoTimer
//
//  Created by keloopA on 2024/2/29.
//

import Foundation

class Item: ObservableObject {
    @Published var name:String
    init(name: String) {
        self.name = name
    }
}
