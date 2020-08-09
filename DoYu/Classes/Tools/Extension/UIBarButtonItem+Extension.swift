//
//  UIBarButtonItem+Extension.swift
//  DoYu
//
//  Created by bughh on 2020/8/9.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String, highlightedImageName: String = "", size: CGSize = .zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highlightedImageName != "" {
            btn.setImage(UIImage(named: highlightedImageName), for: .highlighted)
        }
        
        if size == .zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        
        self.init(customView: btn)
    }
}
