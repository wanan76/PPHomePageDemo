//
//  PPRecommendLoveView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/8.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendLoveView: UIView {
    
    private let itemNum:Int = 31
    private let itemHeight:CGFloat = (UIScreen.main.bounds.size.width - 1) / 2.0 + 60
    var height:CGFloat {
        return (self.itemHeight + 1.0) * CGFloat((self.itemNum - 1) / 2 + 1) + 44
    }
    lazy private var mainCv:UICollectionView = {
        [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 1) / 2.0, height: itemHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.headerReferenceSize = CGSize(width: 0, height: 44)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(PPRecommendLoveCollectionViewCell.self, forCellWithReuseIdentifier: PPRecommendLoveCollectionViewCell.IDENTIFIER)
        cv.backgroundColor = UIColor.groupTableViewBackground
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        cv.isScrollEnabled = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.mainCv)
        self.mainCv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension PPRecommendLoveView:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PPRecommendLoveCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PPRecommendLoveCollectionViewCell.IDENTIFIER, for: indexPath) as! PPRecommendLoveCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        
        for subview in headerView.subviews {
            subview.removeFromSuperview()
        }
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.text = "猜你喜欢"
        headerView.addSubview(lb)
        lb.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        let line1 = UIView()
        line1.backgroundColor = UIColor.gray
        headerView.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.centerY.equalTo(lb)
            make.right.equalTo(lb.snp.left).offset(-15)
            make.width.equalTo(60)
            make.height.equalTo(1)
        }
        let line2 = UIView()
        line2.backgroundColor = UIColor.gray
        headerView.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.centerY.equalTo(lb)
            make.left.equalTo(lb.snp.right).offset(15)
            make.width.equalTo(60)
            make.height.equalTo(1)
        }
        
        return headerView
    }
}
