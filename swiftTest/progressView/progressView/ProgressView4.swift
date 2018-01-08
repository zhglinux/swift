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
//        self.addShadowTo(view: self.progressView, shadowOpacity: 1.0, shadowRadius: 3.0, cornerRadius: 3)
    }
    
    private func setup()
    {
        self.frame = CGRect(x: 0, y:64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
        self.backgroundColor = UIColor(hexValue: 0x000000, alpha: 0.5)
        self.isUserInteractionEnabled = true
        
        self.addSubview(self.bottomView)
        self.bottomView.addSubview(self.title)
        self.bottomView.addSubview(self.percentVal)
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
//        progress.clipsToBounds = true //masksToBounds
  
//        progress.layer.masksToBounds = false  //progress.clipsToBounds
//        progress.layer.shadowColor = UIColor.black.cgColor
//        progress.layer.shadowOffset = CGSize(width: 0, height: 2)
//        progress.layer.shadowRadius = 4.0
//        progress.layer.shadowOpacity = 0.5 //very important!
        
        progress.progressTintColor = UIColor.hexColor(0x3890FF)  //已有进度颜色
        progress.trackTintColor =  UIColor.hexColor(0xD8D8D8)//剩余进度颜色
        
        progress.layer.sublayers?.forEach {
            $0.cornerRadius = 3
            $0.masksToBounds = true;
        }
        
        return progress
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
    
}

extension  ProgressView
{
    func addShadowTo(view: UIView, shadowOpacity:CGFloat, shadowRadius:CGFloat, cornerRadius:CGFloat )
    {
        view.layer.sublayers?.forEach {
            $0.cornerRadius = 3
            $0.masksToBounds = true;
        }
        
        print(view.layer)
        //////// shadow /////////
        let shadowLayer : CALayer = CALayer()
        shadowLayer.frame = view.layer.frame;
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width:0, height:2);
        shadowLayer.shadowOpacity = Float(shadowOpacity);
        shadowLayer.shadowRadius = shadowRadius;
        
        //shadow path
        let path :UIBezierPath = UIBezierPath()
        
        let width = shadowLayer.bounds.size.width;
        let height = shadowLayer.bounds.size.height;
        let  x = shadowLayer.bounds.origin.x;
        let  y = shadowLayer.bounds.origin.y;
        
        let topLeft      = shadowLayer.bounds.origin;
        let topRight     = CGPoint(x : (x + width), y: y);
        let bottomRight  = CGPoint(x : (x + width), y:  (y + height));
        let bottomLeft   = CGPoint(x :  x, y: (y + height));
        
        let offset : CGFloat = -1.0;
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

