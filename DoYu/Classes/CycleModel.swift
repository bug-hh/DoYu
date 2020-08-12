//
//  CycleModel.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    // 标题
    @objc var title: String = ""
    // 展示图片的地址
    @objc var pic_url: String = ""
    // 主播信息对应的字典
    @objc var room: [String : NSObject]? {
        didSet {
            guard let r = room else { return }
            anchor = AnchorModel(dict: r)
        }
    }
    
    // 主播信息对应的模型对象
    @objc var anchor: AnchorModel?
    
    init(dict: [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
