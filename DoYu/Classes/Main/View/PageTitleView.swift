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

private let kScrollLineH: CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

class PageTitleView: UIView {
    private var currentIndex: Int = 0;
    private var titles: [String]
    var delegate: PageTitleViewDelegate?
    
    private lazy var titleLabels: [UILabel] = [UILabel]()
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
        
        // 设置 UI
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

// MARK: - 设置 UI
extension PageTitleView {
    func setupUI() {
        // 添加 scrollview
        addSubview(scrollView)
        scrollView.frame = bounds;
        
        // 添加 title 对应的 label
        setupTitleLabels()
        
        // 设置底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    
    func setupTitleLabels() {
        // 确定 label 的 frame 值
        let labelW: CGFloat = self.frame.width / CGFloat(self.titles.count)
        let labelH: CGFloat = self.frame.height - kScrollLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 创建 label
            let label = UILabel()
            
            // 设置 label 属性
            label.text = title
            label.textAlignment = .center
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            let labelX: CGFloat = CGFloat(index) * labelW
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 添加 label 到 scrollview
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            // 为 label 添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelClicked(_:)))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    func setupBottomLineAndScrollLine() {
        // 添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - lineH, width: self.frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 添加 scrollLine
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        addSubview(scrollLine)
        scrollLine.frame = CGRect(x: self.frame.origin.x, y: self.frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
    
}

// MARK: - 响应点击事件
extension PageTitleView {
    @objc func titleLabelClicked(_ tapGes: UITapGestureRecognizer) {
        // 获取当前点击的 label
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        // 如果重复点击同一个 label，则直接返回
        if currentLabel.tag == currentIndex {
            return
        }
        
        // 获取之前点击的 label
        let oldLabel = self.titleLabels[currentIndex]
        
        // 更换 label 文字的颜色
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        
        // 更新 currentIndex
        currentIndex = currentLabel.tag
        
        // 滚动条位置发生改变
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) {
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        // 通知代理
        delegate?.pageTitleView(self, selectedIndex: currentIndex)
    }
    
}

// MARK: - 对外暴露方法
extension PageTitleView {
    func setTitleWithProgress(_ progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        let sourceLabel = titleLabels[sourceIndex]
        let targetLable = titleLabels[targetIndex]
        
        let moveTotalX = targetLable.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX;
        
        // 颜色渐变
        // 取出颜色变化的范围
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        // 改变 sourceLabel 的颜色
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0, g: kSelectColor.1 - colorDelta.1, b: kSelectColor.2 - colorDelta.2)
        
        // 改变 targetLabel 的颜色
        targetLable.textColor = UIColor(r: kNormalColor.0 + colorDelta.0, g: kNormalColor.1 + colorDelta.1, b: kNormalColor.2 + colorDelta.2)
        
        // 记录最新的 index
        currentIndex = targetIndex
    }
    
}
