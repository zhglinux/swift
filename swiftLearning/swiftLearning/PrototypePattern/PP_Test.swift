//
//  PP_Test.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/20.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation

class PP_Test //PrototypePattern
{
    init() {
        
    }
    
    func PP_Test()
    {
        print("when does this func exec")//not exec when constructing
    }
    
    func  prototypePattern()
    {
        var people = [Person(name:"Joe", country:"france"), Person(name:"Bob", country:"USA")]
        var otherPeople = people
        people[0].country = "UK"
        print("country:  \(otherPeople[0].country)")
        
        //
        let arr0 = people.map { (item) -> Person in
            item.deepCopy()
        }
        print(arr0)
        
        //
        var arr = people.map { (item) -> [Person] in
            var tmp = [Person]()
            tmp.append(item.deepCopy())
            return tmp
        }
        print(arr)
        arr[0][0].country = "arr"
        
        //
        var arr2 = people.map({ $0.deepCopy() })
        print(arr2)
        arr2[0].country = "test"
        
        //
        var anotherPeople = openDeepCopy(data: people) as! [Person]
        people[0].country = "unknown"
        print("country: \(anotherPeople[0].country)")
        
        
    }
    
    //这个是实例方法
    func result()
    {
        var  calc1 = Sum(first: 3, second: 8).Result
        print("calc1 = \(calc1)")
        var  calc2 = Sum(first: 0, second: 9).Result
        print("calc2 = \(calc2)")
        
    }
    
    
    //
    func testEntry()
    {
        
        CocoArray.test()
        
        msgHandler_NN()
        msgHandler()
        
        
        testAppointment_CC_NN_LN()
        testAppointment_CC_NN_L()
        testAppointment_CC_NN()
        testAppointment_CC()
        testAppoint()
        
        Sum.result()    //类方法
        self.result()   // 实例方法
        globalResult()  //全局函数
        
        
        self.prototypePattern()
        
        
        
    }
    
    
    
}

