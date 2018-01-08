//
//  FirstViewController.swift
//  testAlertController
//
//  Created by coco zhou on 2017/12/23.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var clickbtn: UIButton!
     let alertController = UIAlertController(title: "蓝牙未打开", message: "上滑手机底部，出现设置栏", preferredStyle: UIAlertControllerStyle.alert)
    
    var flag: Int = 1
    
    func pop(){
            
        
            
            let target =  subViewController()
            target.view.backgroundColor = UIColor.blue
            target.view.addSubview(UIImageView.init(image: #imageLiteral(resourceName: "abc.png")))
            
            alertController.addChildViewController(target)
            
//            alertController.addTextField { (textfield) in
//
//
//                textfield.background = UIImage.init(named: "abc")
//                textfield.backgroundColor = UIColor.black
//
//                //            textfield.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//
//                print("x: \(textfield.frame.origin.x ) y: \(textfield.frame.origin.y) w: \(textfield.frame.size.width)  h: \(textfield.frame.size.height)")
//
//            }
        
            
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: {
                action in
                
                #if false
                let target =  subViewController()
                
                self.navigationController?.pushViewController(target, animated: true)
                print("---> ok ---")
                #else
                     print("======222=>")
                    self.alertController.dismiss(animated: true, completion: {
                        print("====3333===>")
                    })
                //'UIAlertController can only have one action with a style of UIAlertActionStyleCancel'
                    
                #endif
                
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            //        alertController.view.addSubview(UIImageView.init(image: #imageLiteral(resourceName: "abc.png")))
            self.present(alertController, animated: true, completion: nil);
        
        
    }
    
    func pop2()
    {
        
        let target =   subViewController()
        target.modalPresentationStyle = .overCurrentContext
        self.present(target, animated: true) {
            print("asdf  ")
        }
//        self.addChildViewController(target)
//        self.navigationController?.present(target, animated: true, completion: {
//            print("asdf  ")
//        })
    }
    
    func pop3()
    {
        
        let target =   subViewController()
        target.modalPresentationStyle = .overCurrentContext
        self.present(target, animated: true) {
            print("asdf  ")
        }
        //        self.addChildViewController(target)
        //        self.navigationController?.present(target, animated: true, completion: {
        //            print("asdf  ")
        //        })
    }
    
    @IBAction func clickbttt(_ sender: Any) {
        self.flag = 2
        self.pop() // alertcontroller 出现的时候， 从手机底部 滑不出来控制中心
//        self.pop2()
//        self.pop3()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //当控制中心 滑下去的时候， 当前的viewcontroller  viewWillAppear 并不会被调用
        if self.flag == 2
        {
            self.alertController.dismiss(animated: true, completion: {
                print("asdfadsf adsfas df ")
            })
        }
        
    }
    @objc func loggedIn()
    {
        // alertcontroller  能否dissmiss ？？？ 这个需要测试
        self.alertController.dismiss(animated: true, completion: {
            print("asdfadsf adsfas df ")
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loggedIn),
            name: RXLoggedIn,
            object: nil
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

