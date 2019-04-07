//
//  ViewController.swift
//  PPDemo
//
//  Created by zsx on 2019/4/3.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class ViewController: PPHomeBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.orange
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func getItems() -> [[String : AnyObject]] {
        let titles = ["推荐",
                      "掌柜推荐",
                      "限时抢购",
                      "特价推荐",
                      "人气热卖",
                      "本周上新",
                      "水果",
                      "素菜",
                      "肉禽蛋"]
        var arr = [[String:AnyObject]]()
        
        for (index,item) in titles.enumerated() {
            if index == 0 {
                arr.append(["title":item as AnyObject,"controller":PPHomeRecomendViewController()])
            }else{
                arr.append(["title":item as AnyObject,"controller":PPHomeOtherViewController()])
            }
        }
        
        return arr
    }
    override func selectItem(index: Int) {
        super.selectItem(index: index)
        setTopViewStyle(index)
    }
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        super.scrollViewDidEndDecelerating(scrollView)
        let index:Int = Int(scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        setTopViewStyle(index)
    }
    private func setTopViewStyle(_ index:Int) {
        if index == 0 {
            self.topView.setBackgroundClear(isClear: true)
        }else {
            self.topView.setBackgroundClear(isClear: false)
        }
    }
}


