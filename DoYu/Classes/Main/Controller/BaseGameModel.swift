//
//  BaseGameModel.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class BaseGameModel: NSObject {
    @objc var tag_name: String = ""
    @objc var icon_url: String = ""
    
    override init() {
        
    }
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    

}
