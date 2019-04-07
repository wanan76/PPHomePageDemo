//
//  PPRecommendLoveCollectionViewCell.swift
//  PPDemo
//
//  Created by zsx on 2019/4/8.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendLoveCollectionViewCell: UICollectionViewCell {
    
    static let IDENTIFIER = "PPRecommendLoveCollectionViewCell"
    
    lazy private var icon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "pingguo1")
        icon.contentMode = UIView.ContentMode.scaleAspectFit
        return icon
    }()
    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.text = "红富士红苹果"
        return lb
    }()
    lazy private var descLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.text = "苹果多汁，香甜可口"
        lb.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1)
        return lb
    }()
    
    lazy private var newPriceLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.text = "￥2.98"
        lb.textColor = UIColor.orange
        return lb
    }()
    
    lazy private var addBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.layer.cornerRadius = 12.5
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "add_white_icon"), for: UIControl.State.normal)
        btn.backgroundColor = UIColor(red: 38.0/255.0, green: 172.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        return btn
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
        
        self.addSubview(self.icon)
        self.addSubview(self.titleLb)
        self.addSubview(self.descLb)
        self.addSubview(self.newPriceLb)
        self.addSubview(self.addBtn)
        
        self.icon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(self.icon.snp.width)
        }
        self.titleLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.icon.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(20)
        }
        self.descLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLb.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
        }
        self.newPriceLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.descLb.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        self.addBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-10)
            make.width.height.equalTo(25)
        }
    }
}
