//
//  BaseAnchorViewController.swift
//  DoYu
//
//  Created by 彭豪辉 on 2020/8/12.
//  Copyright © 2020 bughh. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10
private let kHeaderViewH: CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

// todo NormalItem he PrettyItem 指的是什么？
let kPrettyCellID = "kPrettyCellID"
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 4
let kPrettyItemH = kNormalItemW * 4 / 3

class BaseAnchorViewController: BaseViewController {
    
    var baseVM: BaseViewModel!
    
    lazy var collectionView: UICollectionView = {[unowned self] in
        // 创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        // 创建 UICollectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        // 注册自定义 cell
        
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


extension BaseAnchorViewController {
    override func setupUI() {
        // 给父类的 content view 赋值
        contentView = collectionView
        view.addSubview(collectionView)
        super.setupUI()
    }

}


extension BaseAnchorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // todo 强转成自定义cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.anchorGroups[section].anchors.count
    }
    
    // 这个方法，用于返回 header view 或 footer view
    // 具体返回 header view 还是 footer view 由 参数 kind 决定
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 取出 header view
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        
        return headerView
    }
}

extension BaseAnchorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 取出对应的主播信息
        let anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.item]
        
        // 判断是秀场房间还是普通房间
        anchor.isVertical == 0
    }
    
    private func presentShowRoomVC() {
        let showRoomVC = RoomShowViewController()
        // 以 modal 的方式弹出
        present(showRoomVC, animated: true, completion: nil)
    }
    
    private func pushNormalRoomVC() {
        let normalVC = RoomNormalViewController()
        navigationController?.pushViewController(normalVC, animated: true)
    }
    
    
}
