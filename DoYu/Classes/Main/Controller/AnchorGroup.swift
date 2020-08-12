//
//  AnchorGroup.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class AnchorGroup: BaseGameModel {
    // 改组中，对应的房间信息
    var room_list : [[String : NSObject]]? {
        didSet {
            guard let rl = room_list else {
                return
            }
            for dict in rl {
                
            }
        }
    }
    // 组显示图标
    var icon_name: String = "home_header_normal"
    // 定义主播的模型对象数值
    lazy var anchors: [AnchorModel] = [AnchorModel]()

}
