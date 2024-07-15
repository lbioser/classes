//
//  LBPresentaionController.swift
//  Demo
//
//  Created by Libing on 2024/7/15.
//

import UIKit

class LBPresentaionController: UIPresentationController {
    
    var pHeight: CGFloat = 300 //默认弹出的视图的高度
    
    
    private var first = true
    private let sw = UIScreen.main.bounds.size.width // 屏幕的宽
    private let sh = UIScreen.main.bounds.size.height // 屏幕的高
    
    override func containerViewWillLayoutSubviews() {// 回调方法，和viewWillAppear差不多
        super.containerViewWillLayoutSubviews()
        if first { // 通过手势改变presentedView的frame时会触发此方法，使用临时变量first使其只执行一次
            presentedView?.layer.cornerRadius = 20
            presentedView?.frame = CGRect(x: 0, y:  pHeight, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)// 设置弹出控制器视图的大小，presentedView = presentedViewController.view
            first.toggle()
            containerView?.insertSubview(coverView, at: 0) // containerView：作为presentview和coverview的父视图
            let pan = UIPanGestureRecognizer(target: self, action: #selector(pan))
            presentedView?.addGestureRecognizer(pan)
        }
    }

    lazy var coverView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.2)
        v.frame = containerView?.bounds ?? .zero
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    @objc func tap() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    var lastTranslation: CGPoint = .zero
    @objc func pan(ges: UIPanGestureRecognizer) {
        var _: CGFloat = 0
        switch ges.state {
        case .began:
            let p = ges.translation(in: containerView)
             print(p)
        case .changed:
            let translation = ges.translation(in: ges.view)
                    
            // 计算相对于上一坐标点的平移量
            let _ = translation.x - lastTranslation.x
            let deltaY = translation.y - lastTranslation.y
            presentedView?.frame.origin.y += deltaY
            presentedView?.frame.size.height -= deltaY
            // 更新 lastTranslation
            lastTranslation = translation
           
        case .ended:
            lastTranslation = .zero
            adjustViewFinalFrame()
        default:
            break
        }
    }
    
    private func adjustViewFinalFrame() {
        guard let presentedView = presentedView else { return }
        
        switch presentedView.frame.origin.y {
        case ..<(sh/2):
            UIView.animate(withDuration: 0.25, delay: 0) {[self] in
                let h = sh/4
                presentedView.frame.origin.y = h
                presentedView.frame.size.height = sh - h
            }
        case (sh/2)...:
            UIView.animate(withDuration: 0.25, delay: 0) {[self] in
                let h = pHeight
                presentedView.frame.origin.y = h
                presentedView.frame.size.height = sh - h
            }
        default:
            break
        }
    
    }
}
