import UIKit
import SwiftUI
protocol Runnable {
   
    var speed: Double { get }
}
class Dog: Runnable {
    var speed: Double {
        0
    }
    
    //typealias Speed = Double
    
}
class Person {
    var pet:  Runnable {
        return Dog()
    }
}
struct MYs: View {
    var body: some View{
        Text("fff")
    }
}
