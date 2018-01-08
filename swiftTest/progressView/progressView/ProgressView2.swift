//
//  ProgressView.swift
//  RokidApp
//
//  Created by coco zhou on 2017/12/21.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation
import UIKit

class ProgressView : UIView
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func layoutSubviews() {
//        self.addShadow(view: self.progressView)
        self.addShadowTo(view: self.progressView, shadowOpacity: 1.0, shadowRadius: 4.0, cornerRadius: 3)
    }
    
    private func setup()
    {
        self.frame = CGRect(x: 0, y:64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
        self.backgroundColor = UIColor(hexValue: 0x000000, alpha: 0.5)
        self.isUserInteractionEnabled = true
        
        self.addSubview(self.bottomView)
        self.bottomView.addSubview(self.title)
        self.bottomView.addSubview(self.percentVal)
//        self.bottomView.addSubview(self.backView)
        self.bottomView.addSubview(self.progressView)
        
        
        self.bottomView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(130)
        }
        
        self.progressView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(6)
        }
//        self.backView.snp.makeConstraints { (make) in
//            make.left.equalTo(self.progressView.snp.left)
//            make.right.equalTo(self.progressView.snp.right)
//            make.bottom.equalTo(self.progressView.snp.bottom)
//            make.height.equalTo(self.progressView.snp.height)
//        }
        
        self.title.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(41)
            make.bottom.equalTo(self.progressView.snp.top).offset(12)
            make.width.equalTo(105)
        }
        
        self.percentVal.snp.makeConstraints { (make) in
            make.left.equalTo(self.title.snp.right)
            make.top.equalTo(self.title.snp.top)
            make.bottom.equalTo(self.title.snp.bottom)
            make.width.equalTo(50)
        }
        
    }
    
    private lazy var bottomView : UIView  = {
       let bgView = UIView()
       bgView.backgroundColor = UIColor.white
       return bgView
    }()
    
    private lazy var title : UILabel = {
        let label = UILabel()
        label.text = "正在配置设备…".localize //
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var percentVal : UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()

    private lazy var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: UIProgressViewStyle.default)
        progress.isUserInteractionEnabled = false
        progress.center = CGPoint.init(x: UIScreen.main.bounds.size.width/2, y: 50);
        progress.progress = 0.0 //0.0...1.0
        
        //progress.setProgress(0.0, animated: false)
//        progress.layer.opacity = 1.0
//        progress.layer.borderWidth = 0.5
//        progress.layer.cornerRadius = 3.5
//        progress.clipsToBounds = true
  
//        progress.layer.masksToBounds = false
//        progress.layer.shadowColor = UIColor.black.cgColor
//        progress.layer.shadowOffset = CGSize(width: 0, height: 2)
//        progress.layer.shadowRadius = 4.0
//        progress.layer.shadowOpacity = 0.5 //very important!
        
     
        
        progress.progressTintColor = UIColor.hexColor(0x3890FF)  //已有进度颜色
        progress.trackTintColor =  UIColor.hexColor(0xD8D8D8)//剩余进度颜色
        return progress
    }()
    
    private lazy var backView : UIView = {
//        let bView = UIView()
        let alertView = UIView()
        alertView.backgroundColor = UIColor.hexColor(0xD8D8D8)
        alertView.alpha = 1
        alertView.layer.cornerRadius = 1

        //         定义一个阴影
        alertView.layer.shadowOffset = CGSize(width: 0, height :  2)
        alertView.layer.shadowColor = UIColor.black.cgColor
        alertView.layer.shadowOpacity = 1
        alertView.layer.shadowRadius = 4
        //阴影默认是跟随view的边界。view在上面设置成了圆形，所以阴影是圆形，如果想定义成方形，可通过下面代码设置。
        //   let shadowP = CGPathCreateMutable()
        //   CGPathAddRect(shadowP, nil,alertView.bounds)
        //   alertView.layer.shadowPath = shadowP

        // 下面一句如果设置为true，则把阴影也去掉了。如果又想阴影，又想填充一个图片，则可通过alertView.backgroundColor =UIColor(patternImage: UIImage(named: "swift_logo")!)方式填充，
        //  而非通过设置layer.contents= UIImage(named: "swift_logo")?.CGImage 加载。但layer.contents填充图片方式好处是可以任意调整图片的显示方式。
        //  alertView.layer.masksToBounds = true

        
        return alertView
//        bView.layer.masksToBounds = false
//        bView.backgroundColor = UIColor.black
//        bView.layer.shadowColor = UIColor.red.cgColor
//        bView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        bView.layer.shadowRadius = 4.0
//        return bView
    }()
    
    //MARK: function
    public func updateProgress(progress:CGFloat)->Void
    {
        var localProgress = progress
        if progress > 1.0
        {
            localProgress = 1.0
        }
        if progress < 0.0
        {
            localProgress = 0.0
        }

        self.percentVal.text = String.init(format: "%.1f%%", localProgress*100.0)
        self.progressView.progress = Float(localProgress)
    }

    public func remove()
    {
        self.removeFromSuperview()
    }
    
    public func show(parentView: UIView?)->Void
    {
        self.isHidden = false
        if let pView = parentView {
            pView.addSubview(self)

            self.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(UIScreen.main.bounds.height-64)
            }
        }else
        {
             RBLog.debug("==> Parent View is nil.")
        }
        
    }
    
    public func hide()
    {
        self.isHidden = true
        
    }
    
    
    private func  addShadow(view: UIView)
    {
        view.layer.shadowColor = UIColor.black.cgColor;//shadowColor阴影颜色
        //shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        view.layer.shadowOffset = CGSize(width:2, height: 4);
        view.layer.shadowOpacity = 1;//0.8;//阴影透明度，默认0
        view.layer.shadowRadius = 2;//8;//阴影半径，默认3
    
        //shadow path
        let path: UIBezierPath = UIBezierPath()
        
        let width = view.bounds.size.width;
        let height = view.bounds.size.height;
        let x = view.bounds.origin.x;
        let y = view.bounds.origin.y;
        
        let topLeft      = view.bounds.origin;
        let topRight     = CGPoint (x:  x + width,y:  y);
        let bottomRight  = CGPoint (x: x + width,y:  y + height);
        let bottomLeft   = CGPoint (x: x,y:  y + height);
        
        let offset : CGFloat  = 2.0
        path.move(to: CGPoint(x:topLeft.x - offset  , y: topLeft.y - offset) )
        path.addLine(to: CGPoint(x: topRight.x + offset, y: topRight.y - offset))
        path.addLine(to: CGPoint(x: bottomRight.x + offset, y: bottomRight.y + offset))
        path.addLine(to: CGPoint(x: bottomLeft.x - offset, y: bottomLeft.y + offset))
        path.addLine(to: CGPoint(x: topLeft.x - offset , y: topLeft.y - offset))

        //set shadew path
        view.layer.shadowPath = path.cgPath;
    }

    
}

extension  ProgressView
{
    func addShadowTo(view: UIView, shadowOpacity:CGFloat, shadowRadius:CGFloat, cornerRadius:CGFloat )
    {
        //////// shadow /////////
        let shadowLayer : CALayer = CALayer()
        shadowLayer.frame = view.layer.frame;
        shadowLayer.shadowColor = UIColor.black.cgColor //shadowColor阴影颜色
        //shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
        shadowLayer.shadowOffset = CGSize(width:0, height:2);
        shadowLayer.shadowOpacity = Float(shadowOpacity);//0.8;//阴影透明度，默认0
        shadowLayer.shadowRadius = shadowRadius;//8;//阴影半径，默认3
        
        //shadow path
        let path :UIBezierPath = UIBezierPath()
        
        let width = shadowLayer.bounds.size.width;
        let height = shadowLayer.bounds.size.height;
        let  x = shadowLayer.bounds.origin.x;
        let  y = shadowLayer.bounds.origin.y;
        
        let topLeft      = shadowLayer.bounds.origin;
        let topRight     = CGPoint(x : x + width, y: y);
        let bottomRight  = CGPoint(x : x + width, y:  y + height);
        let bottomLeft   = CGPoint(x :x, y: y + height);
        
        let offset : CGFloat = 3.0;
        path.move(to: CGPoint(x: topLeft.x - offset, y:topLeft.y + cornerRadius))
        path.addArc(withCenter: CGPoint(x: topLeft.x + cornerRadius, y: topLeft.y + cornerRadius), radius: (cornerRadius + offset), startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI_2 * 3), clockwise: true)
        
        path.addLine(to: CGPoint(x:topRight.x - cornerRadius, y: topRight.y - offset))
        path.addArc(withCenter: CGPoint(x: topRight.x - cornerRadius, y:topRight.y + cornerRadius ), radius: (cornerRadius + offset) , startAngle: CGFloat(M_PI_2 * 3), endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        
        path.addLine(to: CGPoint(x:bottomRight.x + offset, y:bottomRight.y - cornerRadius))
        path.addArc(withCenter: CGPoint(x: bottomRight.x - cornerRadius, y:bottomRight.y - cornerRadius ), radius: (cornerRadius + offset) , startAngle: 0, endAngle: CGFloat(M_PI_2), clockwise: true)
        
        
        path.addLine(to: CGPoint(x:bottomLeft.x + cornerRadius, y:bottomLeft.y + offset))
        path.addArc(withCenter: CGPoint(x:bottomLeft.x + cornerRadius, y:bottomLeft.y - cornerRadius ), radius: (cornerRadius + offset)  , startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI), clockwise: true)
        path.addLine(to: CGPoint(x:topLeft.x - offset, y:topLeft.y + cornerRadius))
        
        
        //set shadow path
        shadowLayer.shadowPath = path.cgPath
        
        
        //////// cornerRadius /////////
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = true;
        view.layer.shouldRasterize = true;
        view.layer.rasterizationScale = UIScreen.main.scale
        view.superview?.layer.insertSublayer(shadowLayer, below: view.layer)
        

    }
}

