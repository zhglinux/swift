//
//  ViewController.swift
//  testButton
//
//  Created by coco zhou on 2017/12/15.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit

extension UIButton {
    func alignVertical(spacing: CGFloat = 6.0) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else {
                return
                
        }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rate : CGFloat = 15.0/19.0
        let pwidth : CGFloat = 160 * rate
        let pheigth : CGFloat = 190 * rate
        let xoffset : CGFloat = 50.0
        
        let trect = CGRect(x: xoffset + (pwidth+xoffset) * CGFloat(1), y: 20.0,  width:pwidth, height: pheigth)
        
        let button =  UIButton()
        button.frame = trect
        button.backgroundColor = UIColor.green
        
         let imagesArray = ["scene_category_news","scene_category_news"]//"
  
        var image = UIImage(named: imagesArray[1])
        
        //            button.imageRect(forContentRect: CGRect(x:0,y:0, width:80, height:50))
        // button.setImage(image, for: .normal)
        button.imageView?.image = image
        button.titleLabel?.text = "tet"
        button.alignVertical()
        
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

