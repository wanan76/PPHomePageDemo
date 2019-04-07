//
//  PPTopSearchView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/4.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPTopSearchView: UIView {

    lazy private var searchView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        view.layer.cornerRadius = 3
        return view
    }()
    lazy private var searchIcon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "search_black_icon")
        return icon
    }()
    lazy private var searchLb:UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor(red: 166.0/255.0, green: 166.0/255.0, blue: 166.0/255.0, alpha: 1.0)
        lb.font = UIFont.systemFont(ofSize: 16)
        lb.text = "1元起送，30分钟达"
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(isClear:Bool) {
        if isClear {
            self.backgroundColor = UIColor.clear
            self.searchView.backgroundColor = UIColor.white
        }else{
            self.backgroundColor = UIColor.white
            self.searchView.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        }
    }
    func scrollAnimation(offset:CGFloat)  {
        let o:CGFloat = 255.0 - offset / 20.0 * 8.0
        self.searchView.backgroundColor = UIColor(red: o/255.0, green: o/255.0, blue: o/255.0, alpha: 1.0)
     
    }
}
extension PPTopSearchView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.searchView)
        self.searchView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview()
        }
        self.searchView.addSubview(self.searchIcon)
        self.searchView.addSubview(self.searchLb)
        self.searchLb.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        self.searchIcon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.searchLb.snp.left).offset(-3)
            make.width.height.equalTo(25)
        }
    }
}
