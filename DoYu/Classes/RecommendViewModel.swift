//
//  RecommendViewModel.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class RecommendViewModel: BaseViewModel {
    lazy var cycleModels: [CycleModel] = [CycleModel]()
    fileprivate lazy var bigDataGroup: AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup: AnchorGroup = AnchorGroup()
    

}


// MARK: - 发送网络请求
extension RecommendViewModel {
    // 请求推荐数据
    func requestData(_ finishCallback: @escaping () -> ()) {
        let parameters = ["limit": "4", "offset": "0", "time": Date.getCurrentTime()]
        
        let dGroup = DispatchGroup()
        
        //  请求第一部分推荐数据
        dGroup.enter()
        NetworkTools.requestData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : Date.getCurrentTime()]) { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            // 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            dGroup.leave()
        }
        
        // 请求第二部分颜值数据
        dGroup.enter()
        NetworkTools.requestData(.GET, urlString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            
            self.bigDataGroup.tag_name = "颜值"
            self.bigDataGroup.icon_name = "home_header_phone"
            
            // 获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            
            dGroup.leave()
        }
        
        // 请求游戏数据
        dGroup.enter()
        // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1474252024
        loadAnchorData(isGroupData: true, urlString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) {
            dGroup.leave()
        }
        
        // 所有数据请求到后，进行排序
        dGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            finishCallback()
        }
    
    }
    
    // 请求无线轮播的数据
    func requestCycleData(_ finishCallback : @escaping () -> ()) {
        NetworkTools.requestData(.GET, urlString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            // 1.获取整体字典数据
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.字典转模型对象
            for dict in dataArray {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishCallback()
        }
    }
    
}
