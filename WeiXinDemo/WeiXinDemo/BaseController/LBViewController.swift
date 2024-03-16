//
//  LBViewController.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBViewController: UIViewController {

    init(needTableView:Bool = false) {
        super.init(nibName: nil, bundle: nil)
        if needTableView {
            containerStackView.addArrangedSubview(tableView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func addSubViewInContainer(v:UIView) {
        containerStackView.insertArrangedSubview(v, at: 0)
    }
    
    private func setUI() {
        view.backgroundColor = .randomWhiteColor
        view.addSubview(scrollView)
        scrollView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            topConstraint,
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerStackView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            
            
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: containerStackView.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: containerStackView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: containerStackView.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: containerStackView.bottomAnchor)
        ])
    }
    //MARK: - dynimic layoutsubview
    override func viewWillLayoutSubviews() {
        topConstraint.constant =  (navigationController?.navigationBar.isHidden ?? false) ? -view.safeAreaInsets.top : 0
    }
    //MARK: - setnavi tabbar
    func setNavigatinItem(title:String){
        navigationItem.title = title
    }
    func setTabBarItem(title:String,systemImageName imageName:String) {
        navigationController?.tabBarItem.title = title
        navigationController?.tabBarItem.image = UIImage(systemName: imageName)
    }
    //MARK: - lazy load
    private lazy var topConstraint: NSLayoutConstraint = {
        let constraint = scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: view.safeAreaInsets.top)
        return constraint
    }()
    
    private lazy var containerStackView: LBStackView = {
        let stack = LBStackView()
 
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
     lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identfier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

}

extension LBViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identfier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}
