//
//  ViewController.swift
//  ExtApp
//
//  Created by keloopA on 2024/2/22.
//

import UIKit

class ViewController: UIViewController {

    enum TableViewReuseId:String {
        case DefaultId
    }
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.automaticallyAdjustsScrollIndicatorInsets = false
        //tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ViewController.TableViewReuseId.DefaultId.rawValue)
        return tableView
    }()
    lazy var textFiled: UITextField = {
       let textfiled = UITextField()
        return textfiled
    }()
    var navigationTitle: String
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(white: Double.random(in: 0...1), alpha: 1)

        navigationItem.title = navigationTitle
        view.addSubview(tableView)
        view.addSubview(textFiled)
        tableView.addSubview(refreshControl)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: UIDevice.safeDistanceTop, width: Int(view.bounds.width), height:  Int(view.bounds.height)-UIDevice.safeDistanceTop)
        textFiled.frame = CGRect(x: 0, y: 0, width: Int(view.bounds.width), height: UIDevice.safeDistanceTop)
        
    }
    init(navigationTitle: String) {
        self.navigationTitle = navigationTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func refresh(sender: AnyObject) {
        // Pull to Refresh

        // Wait 2 seconds then refresh screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.view.setNeedsDisplay()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.TableViewReuseId.DefaultId.rawValue, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

extension UIDevice {
    
    /// 顶部安全区的调度
  static var safeDistanceTop: Int {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let window = scene?.windows.first
            return Int(window?.safeAreaInsets.top ?? 0) 
        }else{
           let window = UIApplication.shared.windows.first
            return Int(window?.safeAreaInsets.top ?? 0) 
        }
     
    }
}
