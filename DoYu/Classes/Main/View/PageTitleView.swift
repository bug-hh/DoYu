//
//  PageTitleView.swift
//  DoYu
//
//  Created by bughh on 2020/8/9.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int)
}

class PageTitleView: UIView {
    private var currentIndex: Int = 0;
    private var titles: [String]
    private var delegate: PageTitleViewDelegate?
    
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = .orange
        return scrollLine
    }()
    
    init(frame: CGRect, titles: [String]?) {
        self.titles = titles ?? []
        super.init(frame: frame)
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
