//
//  Person.swift
//  NSCoder
//
//  Created by keloopA on 2024/2/21.
//

import Foundation
class Person:NSObject,NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    func encode(with coder: NSCoder) {
        
    }
    
    required init?(coder: NSCoder) {
    
    }
    override init() {
        
    }

}
