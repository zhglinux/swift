//
//  ViewController.swift
//  testShadow
//
//  Created by coco zhou on 2017/12/27.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    public convenience init(hexValue:Int,alpha:CGFloat) {
        self.init(red: CGFloat((hexValue & 0xff0000) >> 16)/255.0, green: CGFloat((hexValue & 0xff00) >> 8)/255.0, blue:(CGFloat(hexValue & 0x0000ff))/255.0, alpha: alpha)
    }
    
    public convenience init(hexValue:Int) {
        self.init(hexValue:hexValue,alpha:1.0)
    }
    
    public static func hexColor(_ hex:Int,alpha:CGFloat) -> UIColor {
        return UIColor.init(hexValue:hex,alpha:alpha)
    }
    
    public static func hexColor(_ hex:Int) -> UIColor {
        return UIColor.init(hexValue:hex);
    }
    
}


extension UIButton
{
    func addShadows(w: CGFloat, h : CGFloat, blur: CGFloat,  hex:Int, alpha:CGFloat)
    {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: w, height: h)
        self.layer.shadowRadius = blur
        self.layer.shadowColor = UIColor.hexColor(hex ).cgColor //UIColor.hexColor(hex, alpha: alpha).cgColor
        self.layer.shadowOpacity = Float(alpha)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.entryButton)
//        self.entryButton.backgroundColor = UIColor.red
        self.entryButton.frame = CGRect(x: 100, y: 100, width: 57, height: 57)
        
//        self.entryButton.snp.makeConstraints { (make) in
//
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    lazy var entryButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "Image") , for: .normal)
        btn.addShadows(w: 0, h: 4, blur: 10, hex: 0x000000, alpha: 0.2)
        return btn
    }()

}

