//
//  LBMyselfController.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBMyselfController: LBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigatinItem(title: "我")
        setTabBarItem(title: "我", systemImageName: "person.fill")

        navigationController?.navigationBar.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
