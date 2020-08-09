//
//  HomeViewController.swift
//  DoYu
//
//  Created by bughh on 2020/8/9.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
}

// MARK: - 设置 UI 界面
extension HomeViewController {
    private func setupUI() {
        // 设置导航栏
        setupNavigationBar()
        
        // 设置 title view
        
    }
    
    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highlightedImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highlightedImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highlightedImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
}
