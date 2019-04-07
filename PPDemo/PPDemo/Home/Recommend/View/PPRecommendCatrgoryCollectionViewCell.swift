//
//  PPRecommendCatrgoryCollectionViewCell.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendCatrgoryCollectionViewCell: UICollectionViewCell {
    
    static let IDENTIFIER = "PPRecommendCatrgoryCollectionViewCell"
    
    lazy private var icon:UIImageView = {
        let icon = UIImageView()
        icon.contentMode = UIView.ContentMode.scaleAspectFill
        icon.layer.masksToBounds = true
        icon.layer.cornerRadius = 15;
        icon.backgroundColor = UIColor(red: 235.0 / 255.0, green: 252.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)
        return icon
    }()
    lazy private var titleLb:UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textAlignment = .center
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(icon)
        self.addSubview(titleLb)
        icon.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(icon.snp.width)
        }
        titleLb.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(icon.snp.bottom)
        }
    }
    
    /// api:设置数据
    ///
    /// - Parameter data: ["icon":"","title":""]
    func setData(data:[String:String]) {
        icon.image = UIImage(named: data["icon"] ?? "")
        titleLb.text = data["title"]
    }
}
