//
//  PPTopAddressMessageView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/3.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit
import SnapKit
class PPTopAddressMessageView: UIView {

    lazy private var addrView:UIView = {
        let view = UIView()
        
        return view
    }()
    lazy private var addrIcon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "addr_black_icon")
        return icon
    }()
    lazy private var addrLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 20)
        lb.text = "云集公寓"
        lb.textColor = UIColor.black
        return lb;
    }()
    lazy private var addrArrowsIcon:UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "right_black_arrows_icon")
        return icon
    }()
    lazy private var messageBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "message_black_icon"), for: UIControl.State.normal)
        return btn
    }()
    lazy private var redPointView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIApplication.shared.statusBarFrame.size.height + 44)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PPTopAddressMessageView {
    func setStyle(isWhite:Bool) {
        if isWhite {
            self.addrIcon.image = UIImage(named: "addr_white_icon")
            self.addrLb.textColor = UIColor.white
            self.addrArrowsIcon.image = UIImage(named: "right_white_arrows_icon")
            self.messageBtn.setImage(UIImage(named: "message_white_icon"), for: UIControl.State.normal)
        }else{
            self.addrIcon.image = UIImage(named: "addr_black_icon")
            self.addrLb.textColor = UIColor.black
            self.addrArrowsIcon.image = UIImage(named: "right_black_arrows_icon")
            self.messageBtn.setImage(UIImage(named: "message_black_icon"), for: UIControl.State.normal)
        }
    }
}
extension PPTopAddressMessageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.addrView)
        self.addrView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(UIApplication.shared.statusBarFrame.size.height)
            make.bottom.equalToSuperview()
        }
        
        self.addrView.addSubview(self.addrIcon)
        self.addrView.addSubview(self.addrLb)
        self.addrView.addSubview(self.addrArrowsIcon)
        self.addrIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        self.addrLb.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.addrIcon.snp.right)
        }
        self.addrArrowsIcon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.addrLb.snp.right)
            make.width.height.equalTo(18)
        }
        
        self.addSubview(self.messageBtn)
        self.messageBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.addrView)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(25)
        }
        self.addSubview(self.redPointView)
        self.redPointView.snp.makeConstraints { (make) in
            make.top.equalTo(self.messageBtn).offset(-3)
            make.right.equalTo(self.messageBtn).offset(3)
            make.width.height.equalTo(10)
        }
    }
}
