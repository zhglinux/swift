//
//  SecondViewController.swift
//  testTextView
//
//  Created by coco zhou on 2018/1/3.
//  Copyright © 2018年 coco zhou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.delegate = self
        
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
    
    
    public func textViewDidChange(_ textView: UITextView){
        print("textViewDidChangeGL_LINES")
    }
    

    @IBAction func clickSetText(_ sender: Any) {
        textView.text = "textView 直接给 赋值 text，不会出发代理函数，比如textViewDidChange  "
        //↓←↑→↓
        
        self.textViewDidChange(textView)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

