//
//  PPRecommendTableViewCell.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendTableViewCell: UITableViewCell {

    static let IDENTIFIER = "PPRecommendTableViewCell"
    static let CELL_HEITHT:CGFloat = 150
    
    lazy private var icon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "pingguo1")
        icon.contentMode = UIView.ContentMode.scaleAspectFit
        return icon
    }()
    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.text = "红富士红苹果"
        return lb
    }()
    lazy private var descLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = "苹果多汁，香甜可口"
        lb.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1)
        return lb
    }()
    lazy private var oddsLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(red: 216.0/255.0, green: 121.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        lb.backgroundColor = UIColor(red: 248.0/255.0, green: 218.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        lb.text = " 特惠 "
        lb.textAlignment = .center
        return lb
    }()
    lazy private var sizeLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1)
        lb.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        lb.text = " 200g/个 "
        lb.textAlignment = .center
        return lb
    }()
    lazy private var newPriceLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.text = "￥2.98"
        lb.textColor = UIColor.orange
        return lb
    }()
    lazy private var oldPriceLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.text = "￥6.9"
        lb.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        return lb
    }()
    lazy private var oldPriceLine:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        return line
    }()
    lazy private var addBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.layer.cornerRadius = 12.5
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(named: "add_white_icon"), for: UIControl.State.normal)
        btn.backgroundColor = UIColor(red: 38.0/255.0, green: 172.0/255.0, blue: 96.0/255.0, alpha: 1.0)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
    }()
    lazy private var line:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return line
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.icon)
        self.addSubview(self.titleLb)
        self.addSubview(self.descLb)
        self.addSubview(self.oddsLb)
        self.addSubview(self.sizeLb)
        self.addSubview(self.newPriceLb)
        self.addSubview(self.oldPriceLb)
        self.addSubview(self.oldPriceLine)
        self.addSubview(self.addBtn)
        self.addSubview(self.line)
        
        self.icon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(self.icon.snp.height)
        }
        self.titleLb.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(self.icon.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        self.descLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLb.snp.bottom).offset(5)
            make.left.equalTo(self.icon.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        self.oddsLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.descLb.snp.bottom).offset(5)
            make.left.equalTo(self.icon.snp.right).offset(20)
            make.height.equalTo(20)
        }
        self.sizeLb.snp.makeConstraints { (make) in
            make.top.equalTo(self.descLb.snp.bottom).offset(5)
            make.left.equalTo(self.oddsLb.snp.right).offset(3)
            make.height.equalTo(20)
        }
        self.newPriceLb.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalTo(self.icon.snp.right).offset(20)
        }
        self.oldPriceLb.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalTo(self.newPriceLb.snp.right).offset(5)
        }
        self.oldPriceLine.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.oldPriceLb)
            make.centerY.equalTo(self.oldPriceLb)
            make.height.equalTo(1)
        }
        self.addBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-20)
            make.width.height.equalTo(25)
        }
        self.line.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
}
