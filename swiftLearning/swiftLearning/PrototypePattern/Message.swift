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

///------------------------------------------------


class Message_NN: NSObject, NSCopying  {

    
    var to : String
    var subject : String
    
    init(to: String, subject: String) {
        self.to = to
        self.subject = subject
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Message_NN(to: self.to, subject: self.subject)
    }
    
}

class DetailMessage: Message_NN {
    var from :String
    
    init(to: String, subject: String, from: String) {
        self.from = from
        super.init(to: to, subject: subject)
    }
    
    override func copy(with zone: NSZone?) -> Any {
        return DetailMessage(to: self.to, subject: self.subject, from: self.from)
    }
    
}


class MessageLogger_NN {
    var messages : [Message_NN] = []
    func logMessage(msg: Message_NN) -> Void {
        messages.append(msg.copy() as! Message_NN)
    }
    
    func processMessages( callback : (Message_NN) -> Void ) -> Void {
        for msg in messages
        {
            callback(msg)
            //msg.callback() //error
        }
    }
    
    func processMessages( callback : (Message_NN) -> String ) -> Void {
        for msg in messages
        {
            var str = callback(msg)
            print("mms = > " + str)
            //msg.callback()
        }
    }
}

func msgHandler_NN ()
{
    var logger = MessageLogger_NN()
    
    var message = Message_NN(to: "Joe", subject: "Hello ..")
    logger.logMessage(msg: message)
    
    message.to = "Bob"
    message.subject = " >>> Free for dinner"
    
    logger.logMessage(msg: message)
    
    logger.logMessage(msg: DetailMessage(to: "John", subject: " go shoping", from: " Jane"))
    
    print("---------------")
    
    logger.processMessages { (msg) -> String in
        if let detail = msg as? DetailMessage
        {
            return detail.to + detail.subject + detail.from
        }
        else
        {
            return msg.to + msg.subject
        }
    }
    
    print("---------------")
    
    logger.processMessages { (msg) -> Void  in
        if let detailMsg = msg as? DetailMessage
        {
            print(detailMsg.to + detailMsg.subject + detailMsg.from)
        }else
        {
            print(msg.subject + msg.to )
        }
    }
    print("---------------")
    logger.processMessages(callback: {print($0.to + $0.subject) })
    
}

