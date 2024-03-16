//
//  LBTabBarController.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .lightGray
        addChildVC()
    }
    
    private func addChildVC() {
        viewControllers = [
            createNavVC(rootVC: LBHomeController(needTableView: true)),
            createNavVC(rootVC: LBContectListController(needTableView: true)),
            createNavVC(rootVC: LBDiscoverController()),
            createNavVC(rootVC: LBMyselfController(needTableView: true)),
        ]
    }
    
    private func createNavVC(rootVC:UIViewController) -> UIViewController {
        
        let vc = LBNavigationController(rootViewController: rootVC)
        return vc
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
