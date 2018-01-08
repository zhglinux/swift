//
//  SecondViewController.swift
//  testSNP
//
//  Created by coco zhou on 2017/12/26.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    lazy var box = UIView()
    
    //保存约束的引用
    var topConstraint:Constraint?
    var heightConstraint:Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        box.backgroundColor = UIColor.orange
        self.view.addSubview(box)
        
        
        box.snp.makeConstraints { (make) -> Void in
            //make.width.height.equalTo(150)
            make.width.equalTo(150)
            make.centerX.equalTo(self.view)
            self.heightConstraint = make.height.greaterThanOrEqualTo(150).constraint
            self.topConstraint = make.top.equalTo(self.view).offset(20).constraint
        }
        
    }
    
    //按钮点击
    var count = 10
    @IBAction func btnTouch(_ sender: AnyObject) {
        //更新修改约束
        count = count + 20
        //self.topConstraint?.update(offset: count)
        self.heightConstraint?.update(offset: count)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

