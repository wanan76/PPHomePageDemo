//
//  PPTopItemsScrollView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/4.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPTopItemsScrollView: UIView {

    var selectItemBlock:((Int) -> ())?
    
    private let selectColor:UIColor = UIColor(red: 38.0/255.0, green: 172.0/255.0, blue: 96.0/255.0, alpha: 1.0)
    
    lazy private var mainSv:UIScrollView = {
        let sv = UIScrollView()
        sv.showsHorizontalScrollIndicator = false
        sv.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return sv
    }()
    lazy private var contentView:UIView = {
        let view = UIView()
        
        return view
    }()
    lazy private var indicatorLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private var items:[String] = [String]()
    var selectIndex = 0
    private var isClickItem:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PPTopItemsScrollView {
    private func initState() {
        self.layoutIfNeeded()
        let v = self.viewWithTag(10)
        self.indicatorLine.frame = CGRect(x: 0, y: self.frame.size.height - 2, width: v?.frame.size.width ?? 0, height: 2)

    }
    
    @objc private func clickItemAction(tap:UITapGestureRecognizer) {
        if let tag = tap.view?.tag {
            
            changeItemState(tag: tag)
            
            selectItemVCenterEqualToSv()
            
            if let block = selectItemBlock {
                block(selectIndex)
            }
            
            isClickItem = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                [unowned self] in
                self.isClickItem = false
            }
        }
    }
    private func changeItemState(tag:Int) {

        changeTitleState(index: tag - 10)
    
        let v = self.viewWithTag(tag)
        UIView.animate(withDuration: 0.2) {
            self.indicatorLine.frame = CGRect(x: v?.frame.origin.x ?? 0, y: self.frame.size.height - 2, width: v?.frame.size.width ?? 0, height: 2)
        }
    }
    private func selectItemVCenterEqualToSv() {
        let v:UIView = self.viewWithTag(selectIndex + 10)!
        
        let centerX:CGFloat = v.frame.origin.x + v.frame.size.width / 2.0
        
        let halfW:CGFloat = self.frame.size.width / 2.0
        
        if centerX < halfW {
            self.mainSv.setContentOffset(CGPoint(x: -self.mainSv.contentInset.left, y: 0), animated: true)
        }else if self.mainSv.contentSize.width - centerX < halfW {
            self.mainSv.setContentOffset(CGPoint(x: self.mainSv.contentSize.width - halfW * 2.0 + self.mainSv.contentInset.right, y: 0), animated: true)
        }else {
            self.mainSv.setContentOffset(CGPoint(x: centerX - halfW, y: 0), animated: true)
        }
    }
    private func styleAnimation() {
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: -self.frame.origin.y / 44.0)
        let y:CGFloat = self.superview?.frame.origin.y ?? 0
        let r:CGFloat = 1.0 - ((-y / 44.0) * (255.0 - 38.0)) / 255.0
        let g:CGFloat = 1.0 - ((-y / 44.0) * (255.0 - 172.0)) / 255.0
        let b:CGFloat = 1.0 - ((-y / 44.0) * (255.0 - 96.0)) / 255.0
        self.indicatorLine.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        for index in 0..<self.items.count {
            let lb:UILabel = self.viewWithTag(1000 + index) as! UILabel
            if index == 0 {
                lb.textColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
            }else{
                lb.textColor = UIColor(red: 1.0 + y / 44.0, green: 1.0 + y / 44.0, blue: 1.0 + y / 44.0, alpha: 1.0)
            }
        }
    }
}
extension PPTopItemsScrollView {
    func setItems(items:[String]) {
        self.items = items
        initUi()
        initState()
    }
    func setStyle(isClear:Bool) {
        if isClear {
            
            styleAnimation()
            
        }else {
            self.backgroundColor = UIColor.white
            self.indicatorLine.backgroundColor = selectColor
            for index in 0..<self.items.count {
                let lb:UILabel = self.viewWithTag(1000 + index) as! UILabel
                if index == selectIndex {
                    lb.textColor = selectColor
                }else{
                    lb.textColor = UIColor.black
                }
            }
        }
    }
    func scrollAnimation(offset:CGFloat) {
        styleAnimation()
    }
    func changeTitleState(index:Int) {
        
        
        let oldLb:UILabel = self.viewWithTag(1000 + selectIndex) as! UILabel
        oldLb.textColor = UIColor.black
        
        let newLb:UILabel = self.viewWithTag(1000 + index) as! UILabel
        newLb.textColor = selectColor
        
        self.selectIndex = index
        
        selectItemVCenterEqualToSv()
    }
    func changeIndicatorLine(offset:CGFloat) {
        if isClickItem {
            return
        }
        let mOffset = offset - UIScreen.main.bounds.size.width * CGFloat(selectIndex)
        if mOffset >= 0 {
            if mOffset <= UIScreen.main.bounds.size.width / 2.0 {
                let oWidth = mOffset * 60.0 / UIScreen.main.bounds.size.width * 2.0
                let v = self.viewWithTag(selectIndex + 10)!
                self.indicatorLine.frame = CGRect(x: v.frame.origin.x, y: self.indicatorLine.frame.origin.y, width: v.frame.size.width + oWidth, height: self.indicatorLine.frame.size.height)
            }else {
                let oWidth = (UIScreen.main.bounds.size.width - mOffset) * 60.0 / UIScreen.main.bounds.size.width * 2.0
                let v = self.viewWithTag(selectIndex + 1 + 10)!
                self.indicatorLine.frame = CGRect(x: v.frame.origin.x - oWidth, y: self.indicatorLine.frame.origin.y, width: v.frame.size.width + oWidth, height: self.indicatorLine.frame.size.height)
            }
        }else{
            if -mOffset < UIScreen.main.bounds.size.width / 2.0 {
                let oWidth = mOffset * 60.0 / UIScreen.main.bounds.size.width * 2.0
                let v = self.viewWithTag(selectIndex + 10)!
                self.indicatorLine.frame = CGRect(x: v.frame.origin.x + oWidth, y: self.indicatorLine.frame.origin.y, width: v.frame.size.width - oWidth, height: self.indicatorLine.frame.size.height)
            }else {
                let oWidth = (-UIScreen.main.bounds.size.width - mOffset) * 60.0 / UIScreen.main.bounds.size.width * 2.0
                let v = self.viewWithTag(selectIndex - 1 + 10)!
                self.indicatorLine.frame = CGRect(x: v.frame.origin.x, y: self.indicatorLine.frame.origin.y, width: v.frame.size.width - oWidth, height: self.indicatorLine.frame.size.height)
            }
        }
    }
}

extension PPTopItemsScrollView {
    private func initUi() {
        self.addSubview(self.mainSv)
        self.mainSv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.mainSv.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(self.frame.size.height)
        }
        
        var tmpView:UIView? = nil
        for (index,item) in items.enumerated() {
            let itemView = UIView()
            itemView.tag = 10 + index
            let tap = UITapGestureRecognizer(target: self, action: #selector(clickItemAction(tap:)))
            itemView.isUserInteractionEnabled = true
            itemView.addGestureRecognizer(tap)
            self.contentView.addSubview(itemView)
            itemView.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                if let tv = tmpView {
                    make.left.equalTo(tv.snp.right).offset(15)
                }else {
                    make.left.equalToSuperview()
                }
            }
            
            let lb = UILabel()
            lb.font = UIFont.boldSystemFont(ofSize: 16)
            lb.textColor = UIColor.white
            lb.tag = 1000 + index
            lb.text = item
            
            itemView.addSubview(lb)
            lb.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
            }
            
            tmpView = itemView
        }
        if let tv = tmpView {
            tv.snp.makeConstraints { (make) in
                make.right.equalToSuperview()
            }
        }
        
        self.contentView.addSubview(self.indicatorLine)
    }
}
