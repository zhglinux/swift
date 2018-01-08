//
//  FirstViewController.swift
//  testSNP
//
//  Created by coco zhou on 2017/12/26.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit
import SnapKit
class FirstViewController: UIViewController {

    lazy var box = UIView()
    
    var scacle = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //单击监听
        let tapSingle=UITapGestureRecognizer(target:self,action:#selector(tapSingleDid))
        tapSingle.numberOfTapsRequired=1
        tapSingle.numberOfTouchesRequired=1
        self.view.addGestureRecognizer(tapSingle)
        
        box.backgroundColor = UIColor.orange
        self.view.addSubview(box)
        
        self.box.snp.makeConstraints { (make) -> Void in
            //视图居中
            make.center.equalTo(self.view).offset(-100)
            //初始宽、高为100（优先级低）
            make.width.height.equalTo(100 * self.scacle).priority(250)
            //最大尺寸不能超过屏幕
            make.width.height.lessThanOrEqualTo(self.view.snp.width)
            make.width.height.lessThanOrEqualTo(self.view.snp.height)
        }
        
        
        
        
    }
    
    //视图约束更新
    override func updateViewConstraints() {
        self.box.snp.updateConstraints{ (make) -> Void in
            //放大尺寸（优先级低）
            make.width.height.equalTo(100 * self.scacle).priority(250)
        }
        
        super.updateViewConstraints()
    }
    
    //点击屏幕
    @objc func tapSingleDid(){
        self.scacle += 1.5
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }


}

