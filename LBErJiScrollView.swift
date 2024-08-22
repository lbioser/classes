//
//  LBErJiScrollView.swift
//  Scroll
//
//  Created by Libing on 2024/8/22.
//

import UIKit
import SnapKit
/// 二级滚动视图
/// let v = ErJiScrollView(totalH: 600, topContentH: 50, headerViewH: 50)
/// view.addSubview(v)
/// v.snp.makeConstraints { make in
///     make.center.equalToSuperview()
///     make.height.equalTo(600)
///     make.width.equalTo(300)
/// }
/// 注意：v的高度要和init的初使化参数totalH保持一致
class LBErJiScrollView: UIView {

    private var totalH = 600.0
    private var topContentH = 50.0
    private var headerViewH = 50.0
    
    /// 二级滚动视图
    /// - Parameters:
    ///   - totalH: 视图高度
    ///   - topContentH: 顶部滑动的高度
    ///   - headerViewH: 悬停视图的高度
    init(totalH: CGFloat,topContentH: CGFloat, headerViewH: CGFloat) {
        self.totalH = totalH
        self.topContentH = topContentH
        self.headerViewH = headerViewH
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(totalH) // totalH
        }
        mainScrollView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(topContentH) // topContentH
            make.width.equalToSuperview()
        }
        mainScrollView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(label.snp.bottom)
            make.height.equalTo(headerViewH) // headerH
        }
        mainScrollView.addSubview(subScrollView)
        subScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(headerView)
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalToSuperview()
            make.height.equalTo(totalH-topContentH) // totalH-topContentH,headerView悬停后的撑满
        }
        
        subScrollView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    //MARK: lazyui -
    lazy var mainScrollView = {
        let v = _ScrollView()
        v.delegate = self
        return v
    }()
    
    lazy var label = {
       let v = UILabel()
        v.numberOfLines = 0
        v.text = "123\n666\nabc"
        return v
    }()
    
    lazy var headerView = {
       let v = UIView()
        v.backgroundColor = .green
        return v
    }()
    
    lazy var subScrollView = {
        let v = _ScrollView()
        v.delegate = self
        return v
    }()

    lazy var contentLabel = {
        let v = UILabel()
         v.numberOfLines = 0
         v.text = "123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc123\n666\nabc"
         return v
    }()
    
    //MARK: control scroll -
    private var mainScrollViewCan = true
    private var subScrollViewCan = false
    
}
extension LBErJiScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            if !mainScrollViewCan {
                mainScrollView.contentOffset.y = topContentH // point A
                subScrollViewCan = true
            } else if scrollView.contentOffset.y >= topContentH {
                mainScrollView.contentOffset.y = topContentH
                mainScrollViewCan = false
                subScrollViewCan = true
            }
        } else {
            if !subScrollViewCan {
                subScrollView.contentOffset.y = 0 // point B
            } else if scrollView.contentOffset.y <= 0 {
                subScrollViewCan = false
                mainScrollViewCan = true
            }
        }
    }
}

class _ScrollView: UIScrollView {
    
}

extension _ScrollView: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        print(self)
        return true
    }
}
