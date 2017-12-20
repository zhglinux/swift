//
//  Global.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/19.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation
import UIKit

//'GlobalConst.Type' does not have a member named 'WEBAPIBASEURL'
// => GlobalConst 必须实例化

class GlobalConst
{
    static let kScreenWidth = UIScreen.main.bounds.size.width
    static let WEBAPIBASEURL = "http://api.zhbaby.org/api/";
    
    
}

/*
 *   替代objective-c中的#define, 替代一下一些常用的宏
 */

// 屏幕的物理宽度
let kScreenWidth = UIScreen.main.bounds.size.width
// 屏幕的物理高度
let kScreenHeight =  UIScreen.main.bounds.size.height



/*
 *   除了一些简单的属性直接用常量表达,更推荐用全局函数来定义替代宏
 */

func  x(view:UIView)->CGFloat
{
    return view.frame.origin.x
}

func  y(view:UIView)->CGFloat
{
    return view.frame.origin.y
}

func  w(view:UIView)->CGFloat
{
    return view.frame.size.width
}

func  h(view:UIView)->CGFloat
{
    return view.frame.size.height
}





// 判断系统版本
func kIS_IOS7() ->Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 7.0 }
func kIS_IOS8() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0 }

// RGBA的颜色设置
func kRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

// App沙盒路径
func kAppPath() -> String! {
    return NSHomeDirectory()
}

// Documents路径
func kBundleDocumentPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as! String
}

// Caches路径
func KCachesPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first as! String
}


func isIPhone4() -> Bool {
    return UIScreen.main.currentMode?.size == CGSize.init(width: 640, height: 960)
}
func isIPhone5() -> Bool {
    return UIScreen.main.currentMode?.size == CGSize(width:640, height: 1136)
}
func isIPhone6() -> Bool {
    return UIScreen.main.currentMode?.size == CGSize.init(width:750, height: 1334)
}
func isIPhone6Plus() -> Bool {
    return UIScreen.main.currentMode?.size == CGSize.init(width:1242, height:2208)
}
func isIPhone6PlusBigMode() -> Bool {
    return UIScreen.main.currentMode?.size == CGSize.init(width: 1125, height:2001)
}


func currentLanguage() -> String {
    return NSLocale.preferredLanguages.first!
}

func systemVersion() -> String {
    return UIDevice.current.systemVersion
}

func appVersion() -> String {
    return String.init(describing: Bundle.main.infoDictionary!["CFBundleShortVersionString"]!)
}



extension UIColor {
    public convenience init(hexString: UInt32, alpha: CGFloat = 1.0) {
        let red     = CGFloat((hexString & 0xFF0000) >> 16) / 255.0
        let green   = CGFloat((hexString & 0x00FF00) >> 8 ) / 255.0
        let blue    = CGFloat((hexString & 0x0000FF)      ) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UITableViewDataSource {
    // return total rows in the tableView
    func totalRows(tableView: UITableView) -> Int {
        let totalSections = self.numberOfSections!(in: tableView)
        var section = 0, total = 0
        while section < totalSections {
            total += self.tableView(tableView, numberOfRowsInSection: section)
            section = section + 1
        }
        return total
    }
}

