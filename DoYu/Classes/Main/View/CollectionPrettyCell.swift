//
//  CollectionPrettyCell.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/13.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class CollectionPrettyCell: CollectionBaseCell {
    var cityButton: UIButton!
    
    override var anchor: AnchorModel? {
        didSet {
            super.anchor = anchor
            cityButton.setTitle(anchor?.anchor_city, for: .normal)
        }
    }
}
