//
//  NSArray.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/20.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation

class  CocoArray   {
    
    class func test()
    {
        var data = NSMutableArray(objects: 10, "iOS" , Person(name: "Joe", country: "USA"))
        var copiedData = data
        
        data[0] = 20
        data[1] = "Mac OS"
        (data[2] as! Person).name = "alpha go"
        
        print("Identity : \(data === copiedData)")
        print(" 0 : \(copiedData[0]) 1: \(copiedData[1]) 2: \(copiedData[2])  ")
        
    }
    
    
}
