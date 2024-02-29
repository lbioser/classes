//
//  main.swift
//  Test
//
//  Created by keloopA on 2024/2/21.
//

import Foundation

print("Hello, World!")
protocol MyP {
    static func + (lhs:Self, rhs:Self) -> Self
}
class Clac{
    func add<T:MyP>(num1: T,num2: T) -> T {
       let sel = #selector(aaa)
        let p = NSProtocolFromString("MyP")
     
        return num1 + num2
    }
    @objc func aaa(a:Int) {
        
    }
}

let c = Clac()

print(c.add(num1: 1, num2: 0.2))
extension Int: MyP {}
extension Double: MyP {}
extension Float: MyP {}

let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
print(path)
