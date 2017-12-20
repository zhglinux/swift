//
//  FirstViewController.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/19.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit




class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        //prototype pattern
        PP_Test().testEntry()
        
        
        
        
        //
        print ( x(view: self.view) )
        print(GlobalConst.kScreenWidth)
        print(kScreenWidth)
        //
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

