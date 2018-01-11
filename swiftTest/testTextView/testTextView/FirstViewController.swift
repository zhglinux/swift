//
//  FirstViewController.swift
//  testTextView
//
//  Created by coco zhou on 2018/1/3.
//  Copyright © 2018年 coco zhou. All rights reserved.
//

import UIKit

/*
 <1> 进入页面显示时
 
 做一个textview， 如果 text 文字少于 1行，则textview 高度是 20
 如果text文字 高度多于1行 小于 5行，则textview 高度根据 text文字变化
 如果text 文字 高度 大于5行，则 textview 高度是5行的高度（100），并且可以滚动
 
 <2> 操作，删除文字， 增加文字（包括粘贴，删除，全选，）
 小于 1行的情况下，删除，没有高度变化
 小于5行的情况下， 删除时高度变小， 增加文字时，高度变大，但不能超过5行的高度
 
 多于5行的情况下， 删除时，如果文字高度仍然大于5行，高度不变， 但小于5行时， 高度变小
 在最后一个文字被删除时， 整体文字不会发生滚动
 
 粘贴时，文字不会滚动不会跳动
*/

class FirstViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
     var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var text1 = "1月2日消息，价值兄今"
        var text25 = "1月2日消息，价值兄今天从多家媒体处了解到，传闻滴滴将收购小蓝单车并将内部孵化的单车团队合并，杀入共享单车领域。价值兄从"
        
        var text5 =  "1月2日消息，价值兄今天从多家媒体处了解到，传闻滴滴将收购小蓝单车并将内部孵化的单车团队合并，杀入共享单车领域。价值兄从滴滴公关部处获得回应称，对于此事不予置评。但有业界人士表示，此现象已经非常鲜明地体现了滴滴准备亲自操盘，进入共享单车市场的坚定决心。这家估值达600亿美金的互联网巨鳄，未来出行野心将是“两条腿+四个轮子”。         收购小蓝+内部孵化，滴滴加码短途出行1月2日消息，价值兄今天从多家媒体处了解到，传闻滴滴将收购小蓝单车并将内部孵化的单车团队合并，杀入共享单车领域。价值兄从滴滴公关部处获得回应称，对于此事不予置评。但有业界人士表示，此现象已经非常鲜明地体现了滴滴准备亲自操盘，进入共享单车市场的坚定决心。这家估值达600亿美金的互联网巨鳄，未来出行野心将是“两条腿+四个轮子”。         收购小蓝+内部孵化，滴滴加码短途出行"
        
        UserDefaults.standard.set(text1, forKey: "text1")
        UserDefaults.standard.set(text25, forKey: "text25")
        UserDefaults.standard.set(text5, forKey: "text5")
        
        
        text = text5
        
        self.textview.text = text
        
        var rect = self.textview.frame
        print("ox: \(rect.origin.x)  oy:\(rect.origin.y) sw:\(rect.size.width)  sh:\(rect.size.height)")
        
        var size = self.textview.contentSize
        print("w: \(size.width) h: \(size.height) ")
        
        var offpoint = self.textview.contentOffset
        print("w: \(offpoint.x) h: \(offpoint.y) ")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clickBtn1(_ sender: Any) {
        
        
    }
    
    @IBAction func clickBtn25(_ sender: Any) {
        
    }
    
    @IBAction func clickBtn5(_ sender: Any) {
        
    }
    
    @IBOutlet weak var scrollRangeToVisible: UIButton!
    
    @IBAction func clickScrollRange(_ sender: Any) {
        
      self.textview.scrollRangeToVisible(NSMakeRange(text.count-1, 1))
    }
    
    @IBAction func clickTextContainerInset(_ sender: Any) {
        
    }
    
    
}

