//
//  PPRecommendTableView.swift
//  PPDemo
//
//  Created by zsx on 2019/4/7.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPRecommendTableView: UIView {

    static let HEIGHT:CGFloat = (150 + 54 + PPRecommendTableViewCell.CELL_HEITHT * 3) * 16
    
    lazy private var mainTv:UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.register(PPRecommendTableViewCell.self, forCellReuseIdentifier: PPRecommendTableViewCell.IDENTIFIER)
        tv.backgroundColor = UIColor.white
        tv.isScrollEnabled = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.mainTv)
        self.mainTv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension PPRecommendTableView:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 16
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PPRecommendTableViewCell.CELL_HEITHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PPRecommendTableViewCell = tableView.dequeueReusableCell(withIdentifier: PPRecommendTableViewCell.IDENTIFIER) as! PPRecommendTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 54
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150))
        let img = UIImageView()
        img.frame = CGRect(x: 15, y: 15, width: UIScreen.main.bounds.size.width - 30, height: 135)
        img.sd_setImage(with: URL(string: "http://pic24.nipic.com/20120906/2786001_082828452000_2.jpg"), completed: nil)
        img.contentMode = UIView.ContentMode.scaleAspectFill
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 10
        header.addSubview(img)
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 54))
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
        btn.setTitle("查看全部>", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        footer.addSubview(btn)
        let line = UIView(frame: CGRect(x: 0, y: 44, width: UIScreen.main.bounds.size.width, height: 10))
        line.backgroundColor = UIColor(red: 239.0/255.0, green: 239.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        footer.addSubview(line)
        return footer
    }
}
