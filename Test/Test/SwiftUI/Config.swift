//
//  Config.swift
//  Test
//
//  Created by keloopA on 2024/3/1.
//

import Foundation
@objc
class Config:NSObject, ObservableObject {
    @objc @Published var name:String = ""
}
