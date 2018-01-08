//
//  First1222ViewController.swift
//  testTextView
//
//  Created by coco zhou on 2018/1/8.
//  Copyright © 2018年 coco zhou. All rights reserved.
//

import UIKit
import  SnapKit

class First1222ViewController: UIViewController {

    var heightConstraint:Constraint?
    var height2Constraint:Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
   
        textview.text = UserDefaults.standard.value(forKey: "text1") as! String
        
  
//
        self.view.addSubview(textview)
        
        textview.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100 )
            make.left.equalToSuperview().offset(30)
            make.width.equalToSuperview().offset(-60)
//            heightConstraint = make.height.equalTo(30).priority(990).constraint
           height2Constraint = make.height.lessThanOrEqualTo(heightOfTextView).priority(999).constraint
            heightConstraint =  make.height.greaterThanOrEqualTo(30).priority(1000).constraint
        }
        
        self.view.addSubview(aView)
        aView.snp.makeConstraints { (make) in
            make.top.equalTo(textview.snp.bottom).offset(80)
            make.left.equalTo(textview)
            make.width.equalTo(textview)
            make.height.equalTo(30)
        }
        
        var size = textview.sizeThatFits(CGSize(width: self.view.frame.size.width - 60.0, height: CGFloat(MAXFLOAT)))
        if size.height > heightOfTextView{
            size.height = heightOfTextView
        }
        
        self.heightConstraint?.update(offset: size.height)
        
        
//        textview.snp.updateConstraints { (make) in
//            make.height.lessThanOrEqualTo(heightOfTextView)
//        }
        
        
        
        
        textview.inputView?.backgroundColor = UIColor.green
        
        textview.textChanged = { [weak self] text in
            let contsize = self?.textview.contentSize
            if (contsize?.height)! > heightOfTextView{
                //self?.textview.frame.size.height = heightOfTextView
                self?.height2Constraint?.update(offset: heightOfTextView)
                
            }else{
                //self?.textview.frame.size = contsize!
                //print(self?.textview.frame)
//                self?.textview.invalidateIntrinsicContentSize()
                self?.heightConstraint?.update(offset: (contsize?.height)!)
                //self?.view.layoutSubviews()
            }
        }
        
        textview.textLimit = { [weak self] text in
            if !text.isEmpty && text.count > NumberLimitOfInput{
                self?.textview.text =  text.subString(to: NumberLimitOfInput)
                //self?.toast("Scene input character count limit".localize)
                return false
            }
            else{
                return true
            }
        }
        
        print(textview.frame)
        
        let contsize = textview.contentSize
        
        if contsize.height > heightOfTextView{
            textview.frame.size.height = heightOfTextView
        }else{
            textview.frame.size = contsize
        }
        
        
        print(textview.frame)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    lazy var textview : CustomTextView = {
        let view = CustomTextView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var aView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
