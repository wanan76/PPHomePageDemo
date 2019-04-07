//
//  PPRecommendCollectionViewCell.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PPRecommendCollectionViewCell"
    
    lazy private var oddsLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(red: 216.0/255.0, green: 121.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        lb.backgroundColor = UIColor(red: 248.0/255.0, green: 218.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        lb.text = "特惠"
        lb.textAlignment = .center
        return lb
    }()
    lazy private var icon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "pingguo1")
        icon.contentMode = UIView.ContentMode.scaleAspectFit
        return icon
    }()
    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.text = "红苹果"
        return lb
    }()
    lazy private var priceView:UIView = {
        let view = UIView()
        return view
    }()
    lazy private var newPriceLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.text = "￥2.98"
        lb.textColor = UIColor.orange
        return lb
    }()
    lazy private var oldPriceLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.text = "￥6.9"
        lb.textColor = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        return lb
    }()
    lazy private var oldPriceLine:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        return line
    }()
    lazy private var addBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.layer.cornerRadius = 12.5
        btn.layer.masksToBounds = true
        btn.setTitle("购物车", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.setImage(UIImage(named: "add_white_icon"), for: UIControl.State.normal)
        btn.backgroundColor = UIColor(red: 38.0/255.0, green: 172.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
    }()
    lazy private var rightLine:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.oddsLb)
        self.addSubview(self.icon)
        self.addSubview(self.titleLb)
        self.addSubview(self.priceView)
        self.priceView.addSubview(self.newPriceLb)
        self.priceView.addSubview(self.oldPriceLb)
        self.priceView.addSubview(self.oldPriceLine)
        self.addSubview(self.addBtn)
        self.addSubview(self.rightLine)
        
        self.oddsLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        self.icon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(35)
            make.top.equalToSuperview().offset(35)
            make.right.equalToSuperview().offset(-35)
            make.height.equalTo(self.bounds.size.width - 50)
        }
        self.titleLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.icon.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        self.priceView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.titleLb.snp.bottom).offset(5)
        }
        self.newPriceLb.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        self.oldPriceLb.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-2)
            make.left.equalTo(self.newPriceLb.snp.right).offset(5)
        }
        self.oldPriceLine.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.oldPriceLb)
            make.left.right.equalTo(self.oldPriceLb)
            make.height.equalTo(1)
        }
        self.addBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.priceView.snp.bottom).offset(10)
            make.height.equalTo(25)
            make.width.equalTo(80)
        }
        self.rightLine.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(1)
        }
    }
}
