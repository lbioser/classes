//
//  ViewController.swift
//  NSCoder
//
//  Created by keloopA on 2024/2/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let p = Person()
       let data = try! NSKeyedArchiver.archivedData(withRootObject: p, requiringSecureCoding: true)
        
       let res = try! NSKeyedUnarchiver.unarchivedObject(ofClass: Person.self, from: data)
        print(res)
     
    }
}

