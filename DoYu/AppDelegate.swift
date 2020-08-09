//
//  AppDelegate.swift
//  DoYu
//
//  Created by bughh on 2020/8/7.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        setupAppearance()
        window?.backgroundColor = .white
        
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

      // 设置全局外观，在很多应用程序中，都会在 AppDelegate 中设置所有控件的全局外观
    private func setupAppearance() {
    //        修改导航栏的全局外观，要在控件创建之前设置，一经设置，全局有效
        UINavigationBar.appearance().tintColor = .orange
        UITabBar.appearance().tintColor = .orange
    }
    

}

