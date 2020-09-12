//
//  CollectionHeaderView.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/13.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit
import SnapKit

class CollectionHeaderView: UICollectionReusableView {
    lazy var titleLabel: UILabel = UILabel(text: "颜值", fontSize: 16)
    lazy var iconImageView: UIImageView = UIImageView(image: UIImage(named: "home_header_phone"))
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("更多", for: .normal)
        return button
    }()
    
    var group: AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            titleLabel.sizeToFit()
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 设置 UI
extension CollectionHeaderView {
    func setupUI() {
        let topView = UIView()
        
        self.addSubview(topView)
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        self.addSubview(moreButton)
        
        topView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(10)
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(topView.snp.bottom).offset(11)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.left.equalTo(iconImageView.snp.right).offset(5)
            make.width.equalTo(33)
            make.height.equalTo(20)
        }
        
        moreButton.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.equalTo(60)
        }
    }
    
}
