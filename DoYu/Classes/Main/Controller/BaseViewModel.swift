//
//  BaseViewModel.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData: Bool, urlString: String, parameters: [String: Any]? = nil, finishedCallBack: @escaping () -> ()) {
        NetworkTools.requestData(.GET, urlString: urlString) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            // 判断是否为分组数据
            if isGroupData {
                for dict in dataArray {
                    self.anchorGroups.append(AnchorGroup(dict: dict))
                }
            } else {
                let group = AnchorGroup()
                
                for dict in dataArray {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                
                self.anchorGroups.append(group)
            }
            
            finishedCallBack()
        }
    }
    
}
