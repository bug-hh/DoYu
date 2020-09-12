//
//  UIButton+Extension.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/13.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(foregroundImageName: String, title: String, textColor: UIColor = .darkGray, fontSize: CGFloat = 14) {
        self.init()
        setImage(UIImage(named: foregroundImageName), for: .normal)
        setTitle(title, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    }
}
