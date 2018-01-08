//
//  MyProgressView.swift
//  progressView
//
//  Created by coco zhou on 2017/12/21.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation
import UIKit

class MyProgressView : UIProgressView
{
    @IBInspectable
    public var topLeft: Bool = false{
        didSet{
            redraw()
        }
    }
    
    @IBInspectable
    public var bottomLeft: Bool = false{
        didSet{
            redraw()
        }
    }
    
    @IBInspectable
    public var topRight: Bool = false{
        didSet{
            redraw()
        }
    }
    
    @IBInspectable
    public var bottomRight: Bool = false{
        didSet{
            redraw()
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 10{
        didSet{
            redraw()
        }
    }
    @IBInspectable
    public var shadowOffset: CGSize = .zero{
        didSet{
            redraw()
        }
    }
    @IBInspectable
    public var shadowRadius: CGFloat = 0{
        didSet{
            redraw()
        }
    }
    @IBInspectable
    public var shadowColor: UIColor = .black{
        didSet{
            redraw()
        }
    }
    @IBInspectable
    public var fillColor: UIColor = .white{
        didSet{
            redraw()
        }
    }
    public var margins: UIEdgeInsets = .zero{
        didSet{
            redraw()
        }
    }
    
    
    var corners: UIRectCorner = []
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.clipsToBounds = false
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    // MARK: - initial method
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var corners: UIRectCorner = []
        if topLeft {
            corners.insert(.topLeft)
        }
        if bottomLeft {
            corners.insert(.bottomLeft)
        }
        if topRight {
            corners.insert(.topRight)
        }
        if bottomRight {
            corners.insert(.bottomRight)
        }
        
        //        let shadRadius = 2.0
        //        let shadOffset = 3.0
        //rect.insetsWithMargins(margins)
        var margin  = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
        var temprect = CGRect(x: rect.origin.x - margin.left, y: rect.origin.y - margin.top, width: rect.size.width - margin.left - margin.right, height: rect.size.height-margin.top-margin.bottom)
        
//        if shadowRadius > 0 {
//            //绘制阴影
//            let shadowPath = UIBezierPath(roundedRect: temprect , byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
//            
//            let context = UIGraphicsGetCurrentContext()
//            context?.setShadow(offset: shadowOffset, blur: shadowRadius, color: shadowColor.cgColor)
//            fillColor.setFill()
//            shadowPath.fill()
//        }
        
        //绘制mask
        let maskPath = UIBezierPath(roundedRect: temprect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        maskLayer.frame = rect
        layer.mask = maskLayer
    }
    
    // MARK: - lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//        var corners: UIRectCorner = []
//        if topLeft {
//            corners.insert(.topLeft)
//        }
//        if bottomLeft {
//            corners.insert(.bottomLeft)
//        }
//        if topRight {
//            corners.insert(.topRight)
//        }
//        if bottomRight {
//            corners.insert(.bottomRight)
//        }
//
//
////        let corners: UIRectCorner = [UIRectCorner.topLeft, UIRectCorner.topRight]
////        let shadowPath = UIBezierPath(roundedRect: rect.insetBy(dx: shadowRadius, dy: shadowRadius), byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
////        let context = UIGraphicsGetCurrentContext()
////        context?.setShadow(offset: shadowOffset, blur: shadowRadius, color: shadowColor.cgColor)
////        fillColor.setFill()
////        shadowPath.fill()
//
//
////        let path = UIBezierPath(rect: bounds.insetBy(dx: 20, dy: 20))
////        UIColor.blue.setFill() //路径填充颜色
////        let conext = UIGraphicsGetCurrentContext()
////        conext?.setShadow(offset: CGSize(width: 10, height: 10), blur: 10, color: UIColor.red.cgColor) //阴影绘制，直接附加到path上了
////        path.fill()
////
//
//        var margin  = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
//
//        var temprect = CGRect(x: rect.origin.x - margin.left, y: rect.origin.y - margin.top, width: rect.size.width - margin.left - margin.right, height: rect.size.height-margin.top-margin.bottom)
//
//        if shadowRadius > 0 {
//            //绘制阴影
//            let shadowPath = UIBezierPath(roundedRect: temprect , byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
//
//            let context = UIGraphicsGetCurrentContext()
//            context?.setShadow(offset: shadowOffset, blur: shadowRadius, color: shadowColor.cgColor)
//            fillColor.setFill()
//            shadowPath.fill()
//        }
//
//
////        let path = UIBezierPath(rect: bounds.insetBy(dx: 2, dy: 2))
////        UIColor.white.setFill() //路径填充颜色
////        let conext = UIGraphicsGetCurrentContext()
////        conext?.setShadow(offset: CGSize(width: 0, height: 2), blur: 4, color: UIColor.red.cgColor) //阴影绘制，直接附加到path上了
////        path.fill()
//    }
    
    
    // MARK: - private method
    fileprivate func redraw(){
        setNeedsDisplay()
        if shadowRadius > 0 {
            backgroundColor = UIColor.clear
        }
    }
    
}


