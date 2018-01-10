//
//  First1_2_ViewController.swift
//  testTextView
//
//  Created by coco zhou on 2018/1/4.
//  Copyright © 2018年 coco zhou. All rights reserved.
//

import UIKit

let NumberLimitOfInput : Int = 200


class First1_2_ViewController: UIViewController {

    @IBOutlet weak var textView12: UITextView!
    
    @IBOutlet weak var showPro: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView12.text = UserDefaults.standard.value(forKey: "text1") as! String
        
        print("------------------------------------")
        
        print(textView12.textInputView.frame)//(0.0, 0.0, 343.0, 33.0)
        print(textView12.textInputView)
        print(textView12.frame)//(16.0, 80.0, 343.0, 98.0)
        print(textView12.contentSize)//(343.0, 33.0)
        print(textView12.contentInset)//UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        print(textView12.textContainerInset) //UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 0.0)
        print(textView12.contentOffset)//(0.0, 0.0)
        print(textView12.contentMode)
        print(textView12.intrinsicContentSize)//(-1.0, -1.0)
        
        textView12.contentInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 8.0, right: 10.0)
        print(textView12.contentInset)//UIEdgeInsets(top: 20.0, left: 10.0, bottom: 8.0, right: 10.0)
        print(textView12.contentSize)//(323.0, 33.0)
        print(textView12.textInputView.frame)//(0.0, 0.0, 323.0, 33.0)
        
        print("---------------------------------------------")
        
        textView12.backgroundColor = UIColor.red
        textView12.textInputView.backgroundColor = UIColor.blue
        
        textView12.contentMode = .scaleAspectFit
        
        self.creatTestTextView()
        self.creatMyCustomTextView()
        
    }

    
    @IBAction func touchUp(_ sender: Any) {
        
        print(textView12.textInputView.frame)
        print(textView12.textInputView)
        print(textView12.frame)
        print(textView12.contentSize)//
        print(textView12.contentInset)//
        print(textView12.textContainerInset) //
        print(textView12.contentOffset)//
        print(textView12.contentMode)
        print(textView12.intrinsicContentSize)//
        
//        textView12.contentInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 8.0, right: 10.0)
        print(textView12.contentInset)//
        print(textView12.contentSize)//
        print(textView12.textInputView.frame)//
        
        print("------------------------===========------------------")
    }
    
    
    func printFocusProperyt() {
        
        print(textView12.textInputView.frame)
        print(textView12.textInputView)
        print(textView12.frame)
        print(textView12.contentSize)//
        print(textView12.contentInset)//
        print(textView12.textContainerInset) //
        print(textView12.contentOffset)//
        print(textView12.contentMode)
        print(textView12.intrinsicContentSize)//
        
        //        textView12.contentInset = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 8.0, right: 10.0)
        print(textView12.contentInset)//
        print(textView12.contentSize)//
        print(textView12.textInputView.frame)//
        
        
    }
    
    func creatTestTextView (){
        
        var textview = UITextView()
        self.view.addSubview(textview)
        textview.frame = CGRect(x: 16, y: 200, width: 343, height: 60)
        textview.text = UserDefaults.standard.value(forKey: "text5") as! String
        textview.backgroundColor = UIColor.green
        
        print(textview.frame)
        
        var contsize = textview.contentSize
        
        if contsize.height > 100
        {
            textview.frame.size.height = 100
        }else{
            textview.frame.size = contsize
        }
        
        print(textview.frame)
        
        
    }
    
    func creatMyCustomTextView (){
        
        var textview = CustomTextView()
        self.view.addSubview(textview)
        textview.frame = CGRect(x: 16, y: 400, width: 343, height: 60)
        textview.text = UserDefaults.standard.value(forKey: "text5") as! String
        textview.backgroundColor = UIColor.green
        textview.textChanged = { [weak self] text in
            var contsize = textview.contentSize
            if contsize.height > 100
            {
                textview.frame.size.height = 100
            }else{
                textview.frame.size = contsize
            }
            
        }
        
        textview.textLimit = { [weak self] text in 
            if !text.isEmpty && text.count > NumberLimitOfInput
            {
                
                textview.text =  text.subString(to: NumberLimitOfInput)
//                self?.toast("Scene input character count limit".localize)
                return false
            }
            else
            {
                return true
            }
        }
        
        print(textview.frame)
        
        var contsize = textview.contentSize
        
        if contsize.height > 100
        {
            textview.frame.size.height = 100
        }else{
            textview.frame.size = contsize
        }
        
        
        print(textview.frame)
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
