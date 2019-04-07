//
//  PPRecommendPriorView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendPriorView: UIView {
    
    static let height:CGFloat = 270
    
    let photos = ["http://pic24.nipic.com/20120906/2786001_082828452000_2.jpg",
                  "http://pic75.nipic.com/file/20150821/9448607_145742365000_2.jpg",
                  "http://pic1.nipic.com/2008-08-14/2008814183939909_2.jpg",
                  "http://pic41.nipic.com/20140429/12728082_192158998000_2.jpg",
                  "http://pic1.win4000.com/wallpaper/9/5450ae2fdef8a.jpg"];
    var photoIndex:Int = 0
    
    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.text = "朴朴优选"
        return lb
    }()
    lazy private var moreBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("更多 >", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), for: UIControl.State.normal)
        return btn
    }()
    
    lazy private var iconView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    lazy private var firstImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = UIView.ContentMode.scaleAspectFill
        img.layer.masksToBounds = true
        img.sd_setImage(with: URL(string: "http://pic24.nipic.com/20120906/2786001_082828452000_2.jpg"), completed: nil)
        return img
    }()
    lazy private var secondImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = UIView.ContentMode.scaleAspectFill
        img.layer.masksToBounds = true
        img.sd_setImage(with: URL(string: "http://pic24.nipic.com/20120906/2786001_082828452000_2.jpg"), completed: nil)
        return img
    }()
    lazy private var thirdImg:UIImageView = {
        let img = UIImageView()
        img.contentMode = UIView.ContentMode.scaleAspectFill
        img.layer.masksToBounds = true
        img.sd_setImage(with: URL(string: "http://pic75.nipic.com/file/20150821/9448607_145742365000_2.jpg"), completed: nil)
        return img
    }()
    
    lazy private var lineView:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        let _ = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc private func timerAction() {
        if photoIndex == photos.count - 1 {
            photoIndex = -1
        }
        photoIndex = photoIndex + 1
        self.firstImg.sd_setImage(with: URL(string: photos[photoIndex]), completed: nil)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.titleLb)
        self.addSubview(self.moreBtn)
        self.titleLb.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview()
            make.height.equalTo(50)
        }
        self.moreBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalTo(self.titleLb)
        }
        self.addSubview(self.iconView)
        self.iconView.addSubview(self.firstImg)
        self.iconView.addSubview(self.secondImg)
        self.iconView.addSubview(self.thirdImg)
        self.iconView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.titleLb.snp.bottom)
            make.height.equalTo(200)
        }
        self.firstImg.snp.makeConstraints { (make) in
            make.left.bottom.top.equalToSuperview()
            make.right.equalTo(self.snp.centerX).offset(-1)
        }
        self.secondImg.snp.makeConstraints { (make) in
            make.right.top.equalToSuperview()
            make.left.equalTo(self.iconView.snp.centerX).offset(1)
            make.bottom.equalTo(self.iconView.snp.centerY).offset(-1)
        }
        self.thirdImg.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.left.equalTo(self.iconView.snp.centerX).offset(1)
            make.top.equalTo(self.iconView.snp.centerY).offset(1)
        }
        
        self.addSubview(self.lineView)
        
        self.lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
    }
}

