//
//  LBStackView.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBStackView: UIStackView {

    init(frame: CGRect = .zero,space:CGFloat = 5, alig:Alignment = .fill, distribution:Distribution = .fill, axis:NSLayoutConstraint.Axis = .vertical){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        spacing = space
        alignment = alig
        self.distribution = distribution
        self.axis = axis
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
