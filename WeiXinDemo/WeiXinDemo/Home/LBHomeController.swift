//
//  LBHomeController.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBHomeController: LBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigatinItem(title: "微信")
        setTabBarItem(title: "微信", systemImageName: "message.fill")
        
        
        addSubViewInContainer(v: v)
        addSubViewInContainer(v: v2)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    lazy var v: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v.backgroundColor = .red
        return v
    }()
    lazy var v2: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 500).isActive = true
        v.backgroundColor = .blue
        return v
    }()
}
