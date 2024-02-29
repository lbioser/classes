//
//  KYDNavigationController.swift
//  ExtApp
//
//  Created by keloopA on 2024/2/22.
//

import UIKit

class KYDNavigationController: UINavigationController {

    var barImage: UIImage
    var barTitle: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = barImage
        tabBarItem.title = barTitle
        //navigationBar.isHidden = true
        navigationBar.barTintColor = .red
        if #available(iOS 15.0, *) {
          let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .red
            appearance.titleTextAttributes = [.foregroundColor:UIColor.black]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
        } else {
            UINavigationBar.appearance().backgroundColor = .white
            UINavigationBar.appearance().barTintColor = .white
            UINavigationBar.appearance().tintColor = .black
        }
        
    }
    
    init(barImage: UIImage, barTitle: String,rootVC:UIViewController) {
        self.barImage = barImage
        self.barTitle = barTitle
        super.init(rootViewController: rootVC)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
