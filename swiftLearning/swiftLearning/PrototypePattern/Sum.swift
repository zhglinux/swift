//
//  Sum.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/19.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation

class Sum  {
    var resultCache: [[Int]]
    let test : [Int]
    var firstValue : Int
    var secondValue : Int
    
    init(first : Int, second: Int)
    {
        self.test = [Int].init(repeating: 8, count: 5)
        self.firstValue = first
        self.secondValue = second
        
        self.resultCache = [[Int]].init(repeating: [Int].init(repeating: 0, count: 10), count: 10)
        
        for i in 0..<10 {
            for j in 0..<10
            {
                resultCache[i][j] = i+j
            }
        }
        
    }
    init(first : Int, second : Int, cacheSize: Int)
    {
        self.test = [Int].init(repeating: 3, count: 9)
        self.firstValue = first
        self.secondValue = second
        self.resultCache = [[Int]].init(repeating: [Int].init(repeating: 0, count: cacheSize), count: cacheSize)
        for i  in 0..<cacheSize {
            for j in 0..<cacheSize
            {
                self.resultCache[i][j] = i+j
            }
        }
    }
    
    convenience init(first2: Int,second2 : Int)
    {
        self.init(first: first2, second: second2, cacheSize: 10)
        
    }
    
    var Result:Int
    {
        get{
            return firstValue < resultCache.count
                && secondValue < resultCache[firstValue].count ?
                resultCache[firstValue][secondValue]
            : firstValue + secondValue
            
        }
        set
        {
            
        }
    }
    
    //这个是类方法，类函数
    class func result()
    {
        var  calc1 = Sum(first: 3, second: 8)
        print("calc1 = \(calc1)")
        print(calc1.Result)
        var  calc2 = Sum(first: 0, second: 9)
        print("calc2 = \(calc2)")
        print(calc2.Result)
        

    }
    
}

// 这个是全局的函数,全局函数存储在
func  globalResult()
{
    var  calc1 = Sum(first: 3, second: 8)
    print("calc1 = \(calc1)")
    var  calc2 = Sum(first: 0, second: 9)
    print("calc2 = \(calc2)")
    
}


