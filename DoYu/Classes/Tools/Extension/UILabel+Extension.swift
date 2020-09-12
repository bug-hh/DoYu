//
//  UILabel+Extension.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/13.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, fontSize: CGFloat = 14, textColor: UIColor = .darkGray) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: fontSize)
        sizeToFit()
    }
}
