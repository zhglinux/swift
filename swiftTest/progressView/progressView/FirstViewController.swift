//
//  FirstViewController.swift
//  progressView
//
//  Created by coco zhou on 2017/12/21.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let testview : CornerShadowView = CornerShadowView(frame: CGRect(x: 30, y: 300, width: self.view.frame.size.width-70, height: 200))
        self.view.addSubview(testview)

        testview.bottomLeft = true
        testview.topLeft = true
       
        testview.fillColor = UIColor.blue
        
        testview.shadowColor = UIColor.red
        testview.shadowRadius = 4
        testview.shadowOffset = CGSize(width: 10, height: 30)
        
        
        testview.layer.shadowColor = UIColor.red.cgColor
        testview.layer.shadowRadius = 4
        testview.layer.shadowOffset =  CGSize(width: 10, height: 30)
        testview.layer.opacity = 1.0
        
//____________________________________________________________________________________
        
        
        let rect = CGRect(x: 30, y: 100, width: self.view.frame.size.width-70, height: 100)
        let pview : MyProgressView = MyProgressView(frame: rect)
        self.view.addSubview(pview)
        pview.progress = 0.38
        pview.tintColor = UIColor.yellow
        
        pview.layer.masksToBounds = false
        pview.layer.shadowOpacity = 1.0
        
        pview.bottomLeft = true
        pview.topLeft = true
        pview.topRight = true
        pview.bottomRight = true
        
        pview.backgroundColor = UIColor.green
        pview.alpha = 1
        pview.layer.cornerRadius = 1
        pview.layer.shadowOffset = CGSize(width: 0, height :  2)
        pview.layer.shadowColor = UIColor.black.cgColor
        pview.layer.shadowOpacity = 1
        pview.layer.shadowRadius = 4
//        pview.fillColor = UIColor.blue
//        pview.shadowColor = UIColor.red
//        pview.shadowRadius = 4
//        pview.shadowOffset = CGSize(width: 10, height: 20)
        
        

        
//        var layer = CALayer()
//        layer.bounds = CGRect(x:0, y: 0
//            , width: UIScreen.main.bounds.width, height: rect.size.height)
//        layer.position = CGPoint(x: 100, y: 100)
//
//        layer.backgroundColor = UIColor.blue.cgColor
//        pview.layer.addSublayer(layer)
        
        
        
        
        
        
        
//        pview.layoutMargins =  UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        pview.layer.borderColor = UIColor.green.cgColor
//        pview.layer.borderWidth = 0.5
//        pview.transform = pview.transform.scaledBy(x: 1, y:2)
        
//        pview.layer.shadowColor = UIColor.red.cgColor
//        pview.layer.shadowOffset  = CGSize(width: 2, height: 2)
//        pview.layer.cornerRadius = 3.0
//        pview.layer.shadowRadius = 0.0
        
        
        
    }



    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

