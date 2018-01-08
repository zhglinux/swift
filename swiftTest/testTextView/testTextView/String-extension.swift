//
//  String-xx.swift
//  rokid
//
//  Created by Shper on 2017/11/20.
//  Copyright © 2017年 Rokid. All rights reserved.
//

import Foundation

extension String {

    /// 截取 from 位置后的所有字符，from 超过字符串长度，返回空字符 ""
    func subString(from: Int) -> String {
        if from >= self.count {
            return ""
        }
        let rang = self.index(startIndex, offsetBy: from)..<self.endIndex
        return self[rang]
    }
    
    /// 从起始位置开始截取到 to 位置的所有字符，to 超过字符串长度，返回整个字符串
    func subString(to: Int) -> String {
        if to >= self.count {
            return self;
        }
        let rang = self.startIndex..<self.index(startIndex, offsetBy: to)
        return self[rang]
    }
    
    /// 截取 location 位置后的 length位长度的字符，location 超过字符串长度，返回空字符 ""；
    /// location + length 超过字符串长度，返回 location 位置后的所有字符
    func subString(location:Int, length:Int) -> String {
        if location >= self.count {
            return ""
        }
        
        if location + length > self.count {
            return self
        }
        
        let locationIndex = self.index(startIndex, offsetBy: location)
        let range = locationIndex..<self.index(locationIndex, offsetBy: length)
        return self[range]
    }
    
    /// 下标的方式截取字符串;  string[1,3] 截取 1~3位的字符串
    subscript(begin: Int, end:Int) -> String {
        if begin >= self.count {
            return ""
        }
        if end >= self.count {
            return subString(from: begin)
        }
        let range = self.index(startIndex, offsetBy: begin)...self.index(startIndex, offsetBy: end)
        return self[range]
    }
    
    /// 下标的方式截取字符串;  string[1...3] 截取 1~3位的字符串
    subscript(range:ClosedRange<Int>) -> String {
        if range.lowerBound >= self.count {
            return ""
        }
        if range.upperBound >= self.count {
            return subString(from: range.lowerBound)
        }
        let range = self.index(startIndex, offsetBy: range.lowerBound )...self.index(startIndex, offsetBy: range.upperBound)
        return self[range]
    }
    
    /// 下标的方式截取字符串;  string[1]  截取 位置为1 处的字符
    subscript(idx: Int) -> String {
        return subString(location: idx, length: 1)
    }
    
}
