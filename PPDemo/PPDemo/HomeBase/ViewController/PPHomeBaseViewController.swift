//
//  PPHomeBaseViewController.swift
//  PPDemo
//
//  Created by zsx on 2019/4/3.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPHomeBaseViewController: UIViewController,PPItemsScrollDelegate {
    
    private var itemsArr:[[String:AnyObject]] = [[String:AnyObject]]()
    
    /// 顶部视图：地点消息部分，搜索框部分，itembar部分
    lazy var topView:PPHomeBaseTopView = {
        [unowned self] in
        let view = PPHomeBaseTopView()
        view.delegate = self
        return view
    }()
    
    /// 控制器view滚动视图
    lazy private var mainSv:UIScrollView = {
        [weak self] in
        let sv = UIScrollView()
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        sv.delegate = self
        sv.isPagingEnabled = true
        sv.bounces = false
        sv.layer.masksToBounds = false
        sv.backgroundColor = UIColor.groupTableViewBackground
        return sv
    }()
    lazy private var contentView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.groupTableViewBackground
        initUi()
        //获取标题，控制器数组
        itemsArr = getItems()
        assert(itemsArr.count > 0, "the count of items must be greater than 0")
        //初始化数据
        initItems()
    }
    
    func getItems() -> [[String:AnyObject]] {
        return [[String:AnyObject]]()
    }
    func selectItem(index: Int) {
        self.mainSv.setContentOffset(CGPoint(x: UIScreen.main.bounds.size.width * CGFloat(index), y: 0), animated: true)
    }
}
extension PPHomeBaseViewController {
    private func initItems() {
        initTitle()
        initControllers()
        initMainSv()
    }
    
    /// 初始化控制器
    private func initControllers() {
        
        for dic in self.itemsArr {
            let vc:PPItemBaseViewController = dic["controller"] as! PPItemBaseViewController
            self.addChild(vc)
            vc.delegate = self
        }
    }
    
    /// 初始化滚动选择工具栏数据
    private func initTitle() {
        var titleItems:[String] = [String]()
        for dic in self.itemsArr {
            
            titleItems.append(dic["title"] as! String)
        }
        self.topView.setItems(items: titleItems)
    }
    
    /// 初始化控制器视图滚动视图
    private func initMainSv() {
        
        var tmpView:UIView? = nil
        for vc in self.children {
            self.contentView.addSubview(vc.view)
            vc.view.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                if let v = tmpView {
                    make.left.equalTo(v.snp.right)
                }else {
                    make.left.equalToSuperview()
                }
            }
            tmpView = vc.view
        }
        tmpView?.snp.makeConstraints({ (make) in
            make.right.equalToSuperview()
        })
    }
}
extension PPHomeBaseViewController:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index:Int = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        //改变滚动选择工具栏item状态
        self.topView.changeTitleState(index: index)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.topView.itemScrollAnimation(offset: scrollView.contentOffset.x)
    }

}
extension PPHomeBaseViewController:PPItemPageDelegate {
    func itemPageOffset(itemPage: PPItemBaseViewController, offset: CGFloat) {
        self.topView.scrollAnimation(itemPage: itemPage, offset: offset)
    }

}
extension PPHomeBaseViewController {
    private func initUi() {
        self.view.addSubview(self.mainSv)
        self.view.addSubview(self.topView)
        self.mainSv.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.topView.snp.bottom)
        }
        self.mainSv.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
