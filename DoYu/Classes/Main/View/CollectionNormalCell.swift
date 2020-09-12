//
//  CollectionNormalCell.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/13.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    
    var roomNameLabel: UILabel!
    
    override var anchor: AnchorModel? {
        didSet {
            super.anchor = anchor
            roomNameLabel.text = anchor?.room_name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - 设置 UI
extension CollectionNormalCell {
    private func setupUI() {
        let home_live_cate_normal = UIImageView(image: UIImage(named: ""))
        
    }
    
}
