//
//  Message.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/20.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation

class Message  {
    var to : String
    var subject : String
    
    init(to: String, subject: String) {
        self.to = to
        self.subject = subject
    }
}

class MessageLogger {
    var messages : [Message] = []
    func logMessage(msg: Message) -> Void {
        messages.append(msg)
    }
    
    func processMessages( callback : (Message) -> Void ) -> Void {
            for msg in messages
            {
                callback(msg)
                //msg.callback() //error
            }
    }
    
    func processMessages( callback : (Message) -> String ) -> Void {
        for msg in messages
        {
            var str = callback(msg)
            print("mms = > " + str)
            //msg.callback()
        }
    }
}

func msgHandler ()
{
    var logger = MessageLogger()
    
    var message = Message(to: "Joe", subject: "Hello ..")
    logger.logMessage(msg: message)
    
    message.to = "Bob"
    message.subject = " >>> Free for dinner"
    
    logger.logMessage(msg: message)
    
    
    logger.processMessages { (msg) -> String in
        return msg.to + msg.subject
    }
    
    logger.processMessages { (msg) in
        print(msg.subject + msg.to )
    }
    
    logger.processMessages(callback: {print($0.to + $0.subject) })
    
    
    
    
}


