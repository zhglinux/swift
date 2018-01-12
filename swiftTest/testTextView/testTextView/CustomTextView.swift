//
//  CustomTextView.swift
//  testTextView
//
//  Created by coco zhou on 2018/1/6.
//  Copyright © 2018年 coco zhou. All rights reserved.
//

import UIKit

let  maxHextHeight : CGFloat = 100

class CustomTextView: UITextView,UITextViewDelegate {

    var textChanged: ((String) -> Void)?
    var textLimit: ((String) -> Bool)?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    private func setup() {

        self.delegate = self

    }
    
    //textview size会及时调整, ㊙️
    //First122ViewController delete comment
    //First1222ViewController, add comment
//    override func invalidateIntrinsicContentSize() {
//
//    }
    
//   
//     var  requiresConstraintBasedLayout :Bool {
//        return true
//    }

    override var intrinsicContentSize: CGSize {
        if self.contentSize.height >= maxHextHeight{
            return CGSize(width: self.frame.size.width, height:maxHextHeight )
        }
        else{
            return self.contentSize
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
//        if textView.text.count > NumberLimitOfInput{
//            textView.text =  textView.text.subString(to: NumberLimitOfInput)
//        }
        
        
        self.textChanged?(textView.text ?? "")
        self.invalidateIntrinsicContentSize()
        
        //print(self.intrinsicContentSize)
        
//        print(textView.text)
    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        
        print(range)
        print("replacementText ..=\(text)")
        
        var should = true
        var vText = textView.text
        
        let index = vText?.index((vText?.startIndex)!, offsetBy: range.location)
        let indexMid = vText?.index((vText?.startIndex)!, offsetBy: range.location+range.length)
        
//        let range2 = vText?.startIndex..<index
//        let range3 = index..<vText?.endIndex
        
        let textBefore = vText![vText?.startIndex ..< index]
        print(textBefore)
        
        let textEnd = vText![indexMid ..< vText?.endIndex]
        print(textEnd)
        
        
        if let numberLimit = self.textLimit, !text.isEmpty{
            
//            if (textBefore+text+textEnd).count > NumberLimitOfInput{
//                textView.text =  (textBefore+text+textEnd).subString(to: NumberLimitOfInput)
//                textView.selectedRange = NSMakeRange(textView.text.count, 0)
//            }
//            return false

            should = numberLimit(textBefore + text + textEnd )
            if should == false { //for First1222ViewController
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                    self.textViewDidChange(textView)
                    self.adjustPos()
                })
            }
        }
        
        return should
        
    }
    func adjustPos (){
        self.selectedRange = NSMakeRange(self.text.count, 0)
    }
    
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            return true
    }
    
    
    public func textViewDidBeginEditing(_ textView: UITextView)
    {
        
    }
    
    public func textViewDidEndEditing(_ textView: UITextView)
    {
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    

}
