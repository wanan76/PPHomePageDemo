//
//  PPHomeRecomendViewController.swift
//  PPDemo
//
//  Created by zsx on 2019/4/4.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPHomeRecomendViewController: PPItemBaseViewController {
    
    /// 底层滚动视图
    lazy private var mainSv:UIScrollView = {
        let sv = UIScrollView()
        if #available(iOS 11.0, *) {
            sv.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        }
        sv.frame = CGRect(x: 0, y: -TOP_VIEW_HEIGHT, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height + 44)
        sv.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 3)
        
        sv.delegate = self
        sv.backgroundColor = UIColor.groupTableViewBackground
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    lazy private var contentView:UIView = {
        let view = UIView()
        
        return view
    }()
    
    /// 轮播图
    lazy private var banner:SXBannerView = {
        let banner = SXBannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width))
        banner.pageControlAlignment = Right
        banner.pageControlShape = Pencil
        
        banner.images = ["http://pic24.nipic.com/20120906/2786001_082828452000_2.jpg",
                         "http://pic75.nipic.com/file/20150821/9448607_145742365000_2.jpg",
                         "http://pic1.nipic.com/2008-08-14/2008814183939909_2.jpg",
                         "http://pic41.nipic.com/20140429/12728082_192158998000_2.jpg",
                         "http://pic1.win4000.com/wallpaper/9/5450ae2fdef8a.jpg"];
        
        banner.clickBannerBlock = {
            index in
            print("the index of banner")
        }

        banner.startPlay()
        banner.playTimeInterval = 3;

        return banner
    }()
    
    /// 分类视图
    lazy private var categorysView:PPRecommendCategoryView = {
        let view = PPRecommendCategoryView()
        let categorys = [["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"pingguo","title":"水果"],
                         ["icon":"kinds_icon","title":"全部分类"]]
        view.setCatrgorys(categorys: categorys)
        return view
    }()
    
    /// 分类视图一下内容视图
    lazy private var animattionView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    /// 展开收起按钮
    lazy private var openBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.backgroundColor = UIColor.white
        btn.setImage(UIImage(named: "down_black_arrows_icon"), for: UIControl.State.normal)
        btn.setImage(UIImage(named: "up_black_arrows_icon"), for: UIControl.State.selected)
        btn.addTarget(self, action: #selector(clickBottomBtnAction), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    /// 分享按钮
    lazy private var shareBtn:UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setBackgroundImage(UIImage(named: "share_img.jpg"), for: UIControl.State.normal)
        btn.layer.cornerRadius = 40
        btn.layer.masksToBounds = true
        return btn
    }()
    
    /// 掌柜推荐
    lazy private var recommendView:PPRecommendRecommendView = {
        let view = PPRecommendRecommendView()
        return view
    }()
    
    /// 朴朴优选
    lazy private var priorView:PPRecommendPriorView = {
        let view = PPRecommendPriorView()
        return view
    }()
    
    /// 限时抢购
    lazy private var timeLimitView:PPRecommendTimeLimitView = {
        let view = PPRecommendTimeLimitView()
        return view
    }()
    
    /// 分类列表
    lazy private var recomendTableView:PPRecommendTableView = {
        let view = PPRecommendTableView()
        return view
    }()
    
    /// 猜你喜欢
    lazy private var loveView:PPRecommendLoveView = {
        let view = PPRecommendLoveView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
        initUi()
    }
}
extension PPHomeRecomendViewController {
    
    /// 点击展开分类视图按钮事件
    @objc private func clickBottomBtnAction() {
        self.openBtn.isSelected = !self.openBtn.isSelected
        UIView.animate(withDuration: 0.5) {
            if !self.openBtn.isSelected {
                self.animattionView.snp.updateConstraints({ (make) in
                    make.top.equalToSuperview().offset(self.banner.frame.size.height + self.categorysView.minHeight)
                })
            }else {
                self.animattionView.snp.updateConstraints({ (make) in
                    make.top.equalToSuperview().offset(self.banner.frame.size.height + self.categorysView.maxHeight)
                })
            }
            self.view.layoutIfNeeded()
        }
    }
}
extension PPHomeRecomendViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.itemPageOffset(itemPage: self, offset: scrollView.contentOffset.y)
    }
}

extension PPHomeRecomendViewController {
    private func initUi() {
        self.view.addSubview(self.mainSv)
        self.mainSv.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.size.width)
        }
        self.contentView.addSubview(self.banner)
        
        self.contentView.addSubview(self.categorysView)
        
        self.contentView.addSubview(self.animattionView)
        self.contentView.backgroundColor = UIColor.red
        self.animattionView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalToSuperview().offset(self.banner.frame.size.height + self.categorysView.minHeight)
        }
        
        self.animattionView.addSubview(self.openBtn)
        self.openBtn.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        self.animattionView.addSubview(self.shareBtn)
        self.shareBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalTo(self.openBtn.snp.bottom).offset(10)
            make.height.equalTo(80)
        }
        
        self.animattionView.addSubview(self.recommendView)
        self.recommendView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.shareBtn.snp.bottom).offset(30)
            make.height.equalTo(50 + (UIScreen.main.bounds.size.width - 30) / 3.0 + 100 + 10)
        }
        self.animattionView.addSubview(self.priorView)
        self.priorView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.recommendView.snp.bottom)
            make.height.equalTo(PPRecommendPriorView.height)
        }
        self.animattionView.addSubview(self.timeLimitView)
        self.timeLimitView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.priorView.snp.bottom)
            make.height.equalTo(PPRecommendTimeLimitView.height)
        }
        self.animattionView.addSubview(self.recomendTableView)
        self.recomendTableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.timeLimitView.snp.bottom)
            make.height.equalTo(PPRecommendTableView.HEIGHT)
        }
        self.animattionView.addSubview(self.loveView)
        self.loveView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.recomendTableView.snp.bottom)
            make.height.equalTo(self.loveView.height)
            
            make.bottom.equalToSuperview()
        }
    }
}
