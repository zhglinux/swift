//
//  String_extension.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/19.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation


extension String
{
    public func deleteUnexpectedCharacters() -> String {
        let str = self.trimmingCharacters(in: .whitespaces)
        let characterSet = CharacterSet(charactersIn: "若琪，,：:；; ")
        let strTmp = str.trimmingCharacters(in: characterSet)
        return strTmp
    }
    
    public func getWords()->String
    {
        var words: String {
            return components(separatedBy: .punctuationCharacters)
                .joined()
                .components(separatedBy: .whitespacesAndNewlines)
                .joined()
                .components(separatedBy: .controlCharacters)
                .joined()
                .components(separatedBy: .nonBaseCharacters)
                .joined()
                .components(separatedBy: .illegalCharacters)
                .joined()
                .components(separatedBy: .symbols)
                .filter{!$0.isEmpty}
                .joined()
        }
        return words
    }
    
    

}
