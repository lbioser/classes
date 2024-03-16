//
//  LBContextTableViewCell.swift
//  WeiXinDemo
//
//  Created by keloopA on 2024/3/15.
//

import UIKit

class LBContextTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
//        contentView.addSubview(imgView)
//        contentView.addSubview(label)
//        
//        NSLayoutConstraint.activate([
//            imgView.heightAnchor.constraint(equalToConstant: 40),
//            imgView.widthAnchor.constraint(equalToConstant: 40),
//            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
//            imgView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
//            imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
//            
//            label.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 5),
//            label.topAnchor.constraint(equalTo: imgView.topAnchor),
//            label.bottomAnchor.constraint(equalTo: imgView.bottomAnchor),
//        ])
        
       let stack = LBStackView(axis: .horizontal)
        contentView.addSubview(stack)
        stack.addArrangedSubview(imgView)
        stack.addArrangedSubview(label)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            
            imgView.heightAnchor.constraint(equalToConstant: 40),
            imgView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: - lazy load
    private lazy var imgView:UIImageView = {
       let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(systemName: "pencil.circle")
        imgView.contentMode = .center
        return imgView
    }()
    
    private lazy var label:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "???..."
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
