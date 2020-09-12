//
//  CollectionBaseCell.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/13.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionBaseCell: UICollectionViewCell {
    
    lazy var iconImageView: UIImageView = UIImageView(image: UIImage(named: "Img_default"))
    lazy var onlineButton: UIButton = UIButton(foregroundImageName: "Image_online", title: "666 在线", textColor: .white, fontSize: 11)
    lazy var nickNameLabel: UILabel = UILabel(text: "小老弟", fontSize: 11, textColor: .white)
    
    var anchor: AnchorModel? {
        didSet {
            guard let anchor = anchor else { return }
            
            // 取出在线人数显示的文字
            var onlineStr: String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online) 在线"
            }
            onlineButton.setTitle(onlineStr, for: .normal)
            
            // 昵称显示
            nickNameLabel.text = anchor.nickname
            
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: iconURL)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionBaseCell {
    private func setupUI() {
        addSubview(iconImageView)
        addSubview(nickNameLabel)
        addSubview(onlineButton)
        
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(153)
        }
        
        nickNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.left).offset(5)
            make.bottom.equalTo(iconImageView.snp.bottom).offset(-5)
        }
        
        onlineButton.snp.makeConstraints { (make) in
            make.right.equalTo(iconImageView.snp.right).offset(-5)
            make.bottom.equalTo(iconImageView.snp.bottom).offset(-5)
        }
    }
}
