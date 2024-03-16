//
//  LBContectListController.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBContectListController: LBViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigatinItem(title: "通讯录")
        setTabBarItem(title: "通讯录", systemImageName: "contextualmenu.and.cursorarrow")
        tableView.register(LBContextTableViewCell.self, forCellReuseIdentifier: LBContextTableViewCell.identfier)
    }
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LBContectListController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LBContextTableViewCell.identfier, for: indexPath) as? LBContextTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
}
