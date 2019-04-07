//
//  PPItemBaseViewController.swift
//  PPDemo
//
//  Created by zsx on 2019/4/5.
//  Copyright © 2019年 zsx. All rights reserved.
//

import UIKit

class PPItemBaseViewController: UIViewController {

    var delegate:PPItemPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
    }
    
}
