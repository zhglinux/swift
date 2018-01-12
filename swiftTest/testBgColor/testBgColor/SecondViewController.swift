//
//  SecondViewController.swift
//  testBgColor
//
//  Created by coco zhou on 2017/12/16.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect(x: 0, y: 100, width: 300, height: 100)
        btn.backgroundColor = UIColor.red
        self.view.addSubview(btn)
        btn.addTarget(self, action:#selector(didClickButton), for: .touchUpInside)
        
        
        
    }

    @objc func didClickButton()
    {
        
        let act = UIAlertController.init(title: "title", message: "message", preferredStyle: .actionSheet)
        
        self.present(act, animated: true) {
            
        }
        
        
    //        let tgvc =  Second2_ViewController()
    ////        self.navigationController?.pushViewController(tgvc, animated: true)
    //        self.present(tgvc, animated: true) {
    //            print("asdfa")
    //        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

