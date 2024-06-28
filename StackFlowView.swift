//
//  StackFlowView.swift
//  TestSnapkit
//
//  Created by Libing on 2024/6/28.
// 多行的选项卡布局
// 缺点：item太多时会有性能问题，没有重用机制

import UIKit

class StackFlowView: UIScrollView {
    private let itemHeight: CGFloat = 30
    private let itemSpacing: CGFloat = 5
    
    private var items: [UIView]
    
    private var clickBlock: ((UIView,Int) -> ())?
    
    private lazy var mainStack = {
        let v = UIStackView()
        v.spacing = itemSpacing
        v.axis = .vertical  //默认水平
        v.alignment = .leading //默认fill，.leading靠左排列
        return v
    }()
    
    private var subStacks: [UIStackView] = []
    
    init(withItems:[UIView], clickItem: ((UIView,Int) -> ())? = nil) {
        items = withItems
        clickBlock = clickItem
        super.init(frame: .zero)
        layoutUI()
    }
    
    private func layoutUI() {
        addSubview(mainStack)
        mainStack.snp.makeConstraints { make in //约束已完整，对于scrollview的子视图，子视图的约束是相当于contentview添加的，超过scrollview的frame的高时会有滚动
            make.width.equalToSuperview()
            make.top.bottom.equalToSuperview()
            //由子视图确实高
//            make.height.equalTo(100)
            
        }
    }
    
    public var allItems: [UIView] {
        return items
    }
    
    public func addItem(_ item:UIView) {
        items.append(item)
        refreshItemsLayout()
    }
    
    /// 删除第几个
    /// - Parameter tag: 第几个的下标，从头横着数
    public func deleteItem(with tag:Int) {
        if let index = items.firstIndex(where: { v in
            v.tag == tag
        }) {
            items.remove(at: index)
            refreshItemsLayout()
        }
        
    }
    
    @objc func tapItem(tap:UITapGestureRecognizer) {
        if let v = tap.view {
            clickBlock?(v,v.tag)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        refreshItemsLayout()
    }
    
    private func refreshItemsLayout() {
        subStacks.removeAll()
        _ = mainStack.arrangedSubviews.map { v in
            v.removeFromSuperview()
        }
        for (i, item) in items.enumerated() {
            item.tag = i
            item.isUserInteractionEnabled = true
            item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapItem)))
            
            let itemW = item.frame.width
            let gapW = (frame.width - (subStacks.last?.arrangedSubviews.last?.frame.maxX ?? 0))
            if subStacks.isEmpty || gapW < itemW {
                let hStack = UIStackView()
                hStack.spacing = itemSpacing
                
                mainStack.addArrangedSubview(hStack)
                hStack.snp.makeConstraints { make in //指定一个高，推算出父视图的高
                    make.height.equalTo(itemHeight)
                }
                subStacks.append(hStack)
            }
            
            item.layer.borderColor = UIColor.gray.cgColor
            item.layer.cornerRadius = 2
            item.layer.borderWidth = 0.5
            
            subStacks.last?.addArrangedSubview(item)
            subStacks.last?.layoutIfNeeded() //每添加一个item就让hstack计算其布局
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
