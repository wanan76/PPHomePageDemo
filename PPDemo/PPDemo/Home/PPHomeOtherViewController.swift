//
//  PPHomeOtherViewController.swift
//  PPDemo
//
//  Created by zsx on 2019/4/4.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPHomeOtherViewController: PPItemBaseViewController {

    lazy private var mainSv:UIScrollView = {
        let sv = UIScrollView()
        if #available(iOS 11.0, *) {
            sv.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        }
        sv.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - TOP_VIEW_HEIGHT + 44)
        sv.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 3)
        
        sv.delegate = self
        let v = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 3))
        v.backgroundColor = getRandColor()
        sv.addSubview(v)
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.addSubview(self.mainSv)
    }
    private func getRandColor() -> UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
extension PPHomeOtherViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.itemPageOffset(itemPage: self, offset: scrollView.contentOffset.y)
    }
}
