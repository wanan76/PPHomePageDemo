//
//  PPHomeBaseTopView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/3.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit
let TOP_VIEW_HEIGHT = UIApplication.shared.statusBarFrame.size.height + 44 + 44 + 44
class PPHomeBaseTopView: UIView {

    var delegate:PPItemsScrollDelegate?
    
    lazy private var addrMsgView:PPTopAddressMessageView = {
        let view = PPTopAddressMessageView()
        
        return view
    }()
    
    lazy private var searchView:PPTopSearchView = {
        let view = PPTopSearchView()
        
        return view
    }()
    
    lazy private var itemScrollView:PPTopItemsScrollView = {
        let view = PPTopItemsScrollView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: TOP_VIEW_HEIGHT)
        self.backgroundColor = UIColor.white
        
        initEvent()
        
        setBackgroundClear(isClear: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PPHomeBaseTopView {
    func setItems(items:[String]) {
        self.itemScrollView.setItems(items: items)
    }
    func changeTitleState(index:Int) {
        self.itemScrollView.changeTitleState(index: index)
    }
    func itemScrollAnimation(offset:CGFloat) {
    
        self.itemScrollView.changeIndicatorLine(offset: offset)
    }
    func setBackgroundClear(isClear:Bool) {
        if isClear {
            let y:CGFloat = self.frame.origin.y
            self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: -y/44)
        }else {
            self.backgroundColor = UIColor.white
        }
        
        self.addrMsgView.setStyle(isWhite: isClear)
        self.searchView.setStyle(isClear: isClear)
        self.itemScrollView.setStyle(isClear: isClear)
    }
    func scrollAnimation(itemPage:PPItemBaseViewController ,offset:CGFloat) {
        
        if self.itemScrollView.selectIndex == 0 {
            if offset > 0 && offset < 44{
                
                self.frame = CGRect(x: 0, y: -offset, width: UIScreen.main.bounds.size.width, height: TOP_VIEW_HEIGHT)
                self.alpha = 1
                if offset <= 22.0 {
                    self.addrMsgView.alpha = 1 - offset / 22.0
                }else{
                    self.addrMsgView.alpha = 0
                }
            }else if offset >= 44 {
                self.frame = CGRect(x: 0, y: -44, width: UIScreen.main.bounds.size.width, height: TOP_VIEW_HEIGHT)
                self.addrMsgView.alpha = 0
                self.alpha = 1
            }else{
                self.frame = CGRect(x: -0, y: -offset, width: UIScreen.main.bounds.size.width, height: TOP_VIEW_HEIGHT)
                self.addrMsgView.alpha = 1
                self.alpha = 1 - (-offset / 44.0)
            }
            self.itemScrollView.scrollAnimation(offset: offset)
            
            if offset > 0 && offset < 64{
                
                self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: offset / 64.0)
                
                self.searchView.scrollAnimation(offset: offset - 44)
            }else if offset >= 64 {
                self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            }
            
            return
        }
        
        if offset > 0 && offset < 44{
            
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: TOP_VIEW_HEIGHT - offset)
            
            if offset <= 22.0 {
                self.addrMsgView.alpha = 1 - offset / 22.0
            }else{
                self.addrMsgView.alpha = 0
            }
        }else if offset >= 44 {
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIApplication.shared.statusBarFrame.size.height + 44 + 44)
            self.addrMsgView.alpha = 0
        }else{
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: TOP_VIEW_HEIGHT)
            self.addrMsgView.alpha = 1
        }
    }
}
extension PPHomeBaseTopView {
    private func initEvent() {
        self.itemScrollView.selectItemBlock = {
            [unowned self] index in
            if let d = self.delegate {
                d.selectItem(index: index)
            }
        }
    }
}
extension PPHomeBaseTopView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(self.addrMsgView)
        self.addSubview(self.searchView)
        self.searchView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-44)
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        self.addSubview(self.itemScrollView)
        self.itemScrollView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
}
