//
//  KYDTabBarController.swift
//  ExtApp
//
//  Created by keloopA on 2024/2/22.
//

import UIKit

class KYDTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVc = KYDNavigationController(barImage: UIImage(systemName: "highlighter")!, barTitle: "first", rootVC: ViewController(navigationTitle: "1"))
        let secondVC = KYDNavigationController(barImage: UIImage(systemName: "highlighter")!, barTitle: "second", rootVC: ViewController(navigationTitle: "2"))
        let thirdVC = KYDNavigationController(barImage: UIImage(systemName: "highlighter")!, barTitle: "third", rootVC: ViewController(navigationTitle: "3"))
        viewControllers = [firstVc,secondVC,thirdVC]

        if #available(iOS 15.0, *) {
          let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .blue
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
        } else {
            UITabBar.appearance().backgroundColor = .blue
        }
        // Do any additional setup after loading the view.
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
