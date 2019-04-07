//
//  PPRecommendTimeLimitView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendTimeLimitView: UIView {
    
    static let height:CGFloat = 270
    
    private var timeNum:Int = 60 * 60 * 24
    
    private var timer:Timer?
    
    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.text = "限时抢购"
        return lb
    }()
    lazy private var moreBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.setTitle("更多 >", for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0), for: UIControl.State.normal)
        return btn
    }()
    lazy private var downLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = "离本场开始"
        return lb
    }()
    lazy private var hourLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.text = "11"
        lb.backgroundColor = UIColor.black
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        return lb
    }()
    lazy private var minuteLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.text = "59"
        lb.backgroundColor = UIColor.black
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        return lb
    }()
    lazy private var secondLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.text = "59"
        lb.backgroundColor = UIColor.black
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        return lb
    }()
    lazy private var colonLb1:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = ":"
        return lb
    }()
    lazy private var colonLb2:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = ":"
        return lb
    }()
    
    lazy private var contentView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return view
    }()
    
    
    lazy private var lineView:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        createItems()
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func timerAction() {
        
        if timeNum == 0 {
            self.timer?.invalidate()
            self.timer = nil
            return
        }
        
        timeNum = timeNum - 1
        
        let hour:Int = timeNum / (60 * 60)
        let minute:Int = (timeNum % (60 * 60)) / 60
        let second:Int = timeNum % 60
      
        if hour < 10 {
            hourLb.text = "0\(hour)"
        }else {
            hourLb.text = "\(hour)"
        }
        if minute < 10 {
            minuteLb.text = "0\(minute)"
        }else {
            minuteLb.text = "\(minute)"
        }
        if second < 10 {
            secondLb.text = "0\(second)"
        }else {
            secondLb.text = "\(second)"
        }
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
        self.addSubview(self.contentView)
        
        self.contentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.titleLb.snp.bottom)
            make.height.equalTo(200)
        }
        
        self.addSubview(self.lineView)
        
        self.lineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        
        self.addSubview(downLb)
        self.addSubview(hourLb)
        self.addSubview(colonLb1)
        self.addSubview(minuteLb)
        self.addSubview(colonLb2)
        self.addSubview(secondLb)
        secondLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLb)
            make.right.equalTo(moreBtn.snp.left).offset(-15)
            make.width.height.equalTo(20)
        }
        colonLb2.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLb)
            make.right.equalTo(secondLb.snp.left)
        }
        minuteLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLb)
            make.right.equalTo(colonLb2.snp.left)
            make.width.height.equalTo(20)
        }
        colonLb1.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLb)
            make.right.equalTo(minuteLb.snp.left)
        }
        hourLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLb)
            make.right.equalTo(colonLb1.snp.left)
            make.width.height.equalTo(20)
        }
        downLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLb)
            make.right.equalTo(hourLb.snp.left).offset(-3)
        }
    }
    
    private func createItems() {
        for index in 0..<4 {
            let view = UIView()
            let w:CGFloat = UIScreen.main.bounds.size.width / 2.0 - 0.5
            let h:CGFloat = 99
            let x:CGFloat = CGFloat(index % 2) * (w + 1)
            let y:CGFloat = CGFloat(index / 2) * (h + 1) + 1
            view.frame = CGRect(x: x, y: y, width: w, height: h)
            view.backgroundColor = UIColor.white
            
            self.contentView.addSubview(view)
            
            let icon = UIImageView()
            icon.contentMode = UIView.ContentMode.scaleAspectFit
            icon.image = UIImage(named: "pingguo1")
            view.addSubview(icon)
            icon.snp.makeConstraints { (make) in
                make.centerY.equalTo(view)
                make.left.equalToSuperview().offset(20)
                make.width.height.equalTo(60)
            }
            let tLb = UILabel()
            tLb.font = UIFont.systemFont(ofSize: 15)
            tLb.text = "红苹果"
            view.addSubview(tLb)
            tLb.snp.makeConstraints { (make) in
                make.top.equalTo(icon.snp.top)
                make.left.equalTo(icon.snp.right).offset(20)
                make.right.equalToSuperview().offset(-10)
            }
            let sLb = UILabel()
            sLb.font = UIFont.systemFont(ofSize: 14)
            sLb.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
            sLb.text = "200g/个"
            view.addSubview(sLb)
            sLb.snp.makeConstraints { (make) in
                make.top.equalTo(tLb.snp.bottom).offset(5)
                make.left.equalTo(icon.snp.right).offset(20)
                make.right.equalToSuperview().offset(-10)
            }
            let jLb = UILabel()
            jLb.font = UIFont.systemFont(ofSize: 14)
            jLb.textColor = UIColor.red
            jLb.text = "敬请期待"
            view.addSubview(jLb)
            jLb.snp.makeConstraints { (make) in
                make.bottom.equalTo(icon.snp.bottom)
                make.left.equalTo(icon.snp.right).offset(20)
            }
            let pLb = UILabel()
            pLb.font = UIFont.systemFont(ofSize: 14)
            pLb.textColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
            pLb.text = "￥22"
            view.addSubview(pLb)
            pLb.snp.makeConstraints { (make) in
                make.centerY.equalTo(jLb)
                make.left.equalTo(jLb.snp.right).offset(5)
            }
            let line = UIView()
            line.backgroundColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
            view.addSubview(line)
            line.snp.makeConstraints { (make) in
                make.centerY.equalTo(pLb)
                make.left.right.equalTo(pLb)
                make.height.equalTo(1)
            }
            
            
        }
    }
}
