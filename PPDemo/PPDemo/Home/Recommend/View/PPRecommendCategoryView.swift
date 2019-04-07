//
//  PPRecommendCategoryView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendCategoryView: UIView {
    
    var maxHeight:CGFloat = 0
    var minHeight:CGFloat = 0
    
    /// 分类数组
    private var categorys:[[String:String]] = [[String:String]]()
    
    /// item间隔
    private let margin:CGFloat = 20
    /// UICollectionViewFlowLayout.itemSize的高度
    private var itemHeight:CGFloat {
        get {
            return (UIScreen.main.bounds.size.width - self.margin * 6) / 5 + 25
        }
    }
    /// UICollectionViewFlowLayout.itemSize的宽度
    private var itemWidth:CGFloat {
        get {
            return (UIScreen.main.bounds.size.width - self.margin * 6) / 5
        }
    }
    
    /// 分类UICollectionView
    lazy private var mainCv:UICollectionView = {
        [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.sectionInset = UIEdgeInsets(top: self.margin, left: self.margin, bottom: 0, right: self.margin)
        layout.minimumLineSpacing = self.margin
        layout.minimumInteritemSpacing = self.margin
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.isScrollEnabled = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(PPRecommendCatrgoryCollectionViewCell.self, forCellWithReuseIdentifier: PPRecommendCatrgoryCollectionViewCell.IDENTIFIER)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUi() {
        self.addSubview(self.mainCv)
        self.mainCv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
extension PPRecommendCategoryView {
    
    /// api:设置分类数据
    ///
    /// - Parameter categorys: 分类数组
    func setCatrgorys(categorys:[[String:String]]) {
        self.categorys = categorys
        
        self.mainCv.reloadData()
        
        let lines = categorys.count / 5
        
        minHeight = (itemHeight + margin) * CGFloat(2)
        maxHeight = (itemHeight + margin) * CGFloat(lines)
        
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.width, width: UIScreen.main.bounds.size.width, height: maxHeight)
    }
}
extension PPRecommendCategoryView:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PPRecommendCatrgoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PPRecommendCatrgoryCollectionViewCell.IDENTIFIER, for: indexPath) as! PPRecommendCatrgoryCollectionViewCell
        cell.setData(data: categorys[indexPath.item])
        return cell
    }
}
