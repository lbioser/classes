import UIKit

var greeting = "Hello, playground"

struct MyStruct<T> {
    private var arrayRep = [T]()
}

let s = MyStruct<String>()

