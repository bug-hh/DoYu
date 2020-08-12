//
//  BaseViewController.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView: UIView?
    
    // todo unowned 什么意思？
    // todo fileprivate 什么意思
    fileprivate lazy var animImageView: UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        /*
         autoresizingMask: An integer bit mask that determines how the receiver resizes itself when its superview’s bounds change.
         */
        imageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - 设置 UI
extension BaseViewController {
    @objc func setupUI() {
        // 隐藏 content view
        contentView?.isHidden = true
        
        // 添加执行动画的 UIImageView
        view.addSubview(animImageView)
        
        // 执行动画
        animImageView.startAnimating()
        
        // 设置 view 的背景颜色
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        // 停止动画
        animImageView.startAnimating()
        // 隐藏 animImageView
        animImageView.isHidden = true
        // 显示 content view
        contentView?.isHidden = false
    }
    
}
