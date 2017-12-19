//
//  Person.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/19.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation


class Person : NSObject, NSCopying {

    var name: String
    var country:String
    
    init(name:String, country:String)
    {
        self.name = name
        self.country = country
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name:self.name, country: self.country)
    }
    
    
    func test()
    {
        print("this is test func")
    }
}


func deepCopy(data:[AnyObject]) -> [AnyObject]
{
    return data.map({ (item) -> AnyObject in
        if (item is NSCopying && item is NSObject)
        {
            return (item as! NSObject).copy() as AnyObject;
        }else
        {
            return item
        }
    })
}



