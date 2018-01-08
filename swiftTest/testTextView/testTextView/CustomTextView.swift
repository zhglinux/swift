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
    
    //textview size会及时调整
    override func invalidateIntrinsicContentSize() {

    }
    
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
        
        self.textChanged?(textView.text ?? "")
        
        self.invalidateIntrinsicContentSize()
        
        //print(self.intrinsicContentSize)
        
//        print(textView.text)
    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool {
        
        print(range)
        print("deleting ..=\(text)")
        
        var should = true
        
        if let numberLimit = self.textLimit, !text.isEmpty{
            should = numberLimit(textView.text+text)
        }
        
        return should
        
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