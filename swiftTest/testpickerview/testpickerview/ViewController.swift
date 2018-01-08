//
//  ViewController.swift
//  testpickerview
//
//  Created by coco zhou on 2017/12/28.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
   

    
    
    var pickerView: UIPickerView!
    
    var month = [String]()
    var week = [String]()
    
    override func viewDidLoad() {
        
        // 初始化数据
        month = ["January"]
        week = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        // 定义一个按钮，复原数据回到初始状态
        let button1 = UIButton()
        button1.frame = CGRect(x:self.view.frame.width/2 - 200,y: 50,width: 400, height: 50)
        button1.setTitle("复原数据回到初始状态",  for: .normal)
        button1.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        button1.tag = 1
        
        // 定义一个按钮，刷新数据成中文
        let button2 = UIButton()
        button2.frame = CGRect(x: self.view.frame.width/2 - 200, y:150, width:400,height: 50)
        button2.setTitle("刷新数据成中文",   for: .normal)
        
        button2.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button2.tag = 2
        
        // 定义一个按钮，打印当前选中的月份和星期
        let button3 = UIButton()
        button3.frame = CGRect(x: self.view.frame.width/2 - 200, y:  250, width : 400, height :  50)
        button3.setTitle("打印当前选中的月份和星期", for: .normal)
        button3.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        button3.tag = 3
        
        // 初始化 myPickerView
        pickerView = UIPickerView(frame: CGRect (x:  0, y:  self.view.frame.height - 200, width :  self.view.frame.width, height :  45))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.red
        // 显示选中框，iOS7 以后不起作用
        pickerView.showsSelectionIndicator = false
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(pickerView)
    }
    
   // 设置行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if(component == 0){
            return month.count
        }
        if(component == 1){
            return week.count
        }
        return 0
    }
    
    
    
    
     // 设置列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 3
    }
    
    // 设置每行具体内容（titleForRow 和 viewForRow 二者实现其一即可）
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(component == 0){
            return month[row]
        }
        if(component == 1){
            return week[row]
        }
        if(component == 2){
            return month[row]
        }
        return nil
    }
    
    // 选中行的操作
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
             print("month selected: \(month[row])")
        }
        if(component == 1){
            print("week selected: \(week[row])")
        }
    }
    
    /// 响应按钮点击事件
    @objc func buttonAction(sender: UIButton) {
        let num = sender.tag
        switch num {
        case 1:
            // 复原数据回到初始状态并重置
            month = ["January","February","March","April","May","June","July","August","September","October","November","December"]
            week = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: true)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        case 2:
            // 刷新数据成中文并重置
            month = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
            week = ["星期一","星期二","星期三","星期四","星期五","星期六","星期天"]
            pickerView.reloadAllComponents()
            pickerView.selectRow(0, inComponent: 0, animated: true)
            pickerView.selectRow(0, inComponent: 1, animated: true)
        case 3:
            // 打印当前选中的月份和星期
            let monthIndex = pickerView.selectedRow(inComponent: 0)
            let weekIndex = pickerView.selectedRow(inComponent: 1)
            print("month: \(month[monthIndex]); week: \(week[weekIndex])")
        default:
            break
        }
    }
    
}

