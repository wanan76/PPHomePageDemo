//
//  PPRecommendRecommendView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendRecommendView: UIView {

    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.text = "掌柜推荐"
        return lb
    }()
    lazy private var moreBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("更多 >", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), for: UIControl.State.normal)
        return btn
    }()
    lazy private var line:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return line
    }()
    lazy private var mainCv:UICollectionView = {
        [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 30) / 3.0, height: (UIScreen.main.bounds.size.width - 30) / 3.0 + 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(PPRecommendCollectionViewCell.self, forCellWithReuseIdentifier: PPRecommendCollectionViewCell.identifier)
        cv.backgroundColor = UIColor.white
        cv.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: (UIScreen.main.bounds.size.width - 30) / 3.0 + 100)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    lazy private var lineView:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.titleLb)
        self.addSubview(self.moreBtn)
        self.addSubview(self.line)
        self.addSubview(self.mainCv)
        self.addSubview(self.lineView)
        self.titleLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalTo(self.titleLb)
        }
        self.line.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.mainCv.snp.top)
            make.height.equalTo(1)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainCv.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
    }
}
extension PPRecommendRecommendView:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:PPRecommendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PPRecommendCollectionViewCell.identifier, for: indexPath) as! PPRecommendCollectionViewCell
       
        return cell
    }
}
