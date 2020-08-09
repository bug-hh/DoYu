//
//  MainViewController.swift
//  DoYu
//
//  Created by bughh on 2020/8/8.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
    }
    
}

// 设置界面
extension MainViewController {
    private func addChildViewControllers() {
        // 设置 tintColor - 图片渲染颜色, 如果在 AppDelegate 里设置了全局渲染，那么这里就不用渲染了
        // 性能提升技巧 - 如果能用颜色解决，就不建议使用图片
        addChildViewController(vc: HomeViewController(), title: "首页", imageName: "btn_home_normal", selectedImageName: "btn_home_selected")
        addChildViewController(vc: LiveViewController(), title: "直播", imageName: "btn_live_normal", selectedImageName: "btn_live_selected")
        addChildViewController(vc: FollowViewController(), title: "关注", imageName: "btn_follow_normal", selectedImageName: "btn_follow_selected")
        addChildViewController(vc: ProfileViewController(), title: "我的", imageName: "btn_user_normal", selectedImageName: "btn_user_selected")
    }
    private func addChildViewController(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        // 设置标题 - 由内至外设置的
        vc.title = title
        
        // 设置图像
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        // 导航控制器
        let nav = UINavigationController(rootViewController: vc)
        
        addChild(nav)
    }
    
}
