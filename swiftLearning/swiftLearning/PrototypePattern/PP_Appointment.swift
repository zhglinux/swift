//
//  PP_Appointment.swift
//  swiftLearning
//
//  Created by coco zhou on 2017/12/20.
//  Copyright © 2017年 coco zhou. All rights reserved.
//

import Foundation

// 使用 struct 创建 的对象 属于 值类型
struct  Appointment {
    var name : String
    var day : String
    var place : String
    
    func printDetails(who: String) -> Void {
        print("\(who) and \(name) on \(day) at \(place) had a appointment")
    }
    
    
}


func testAppoint()
{
    var beerMeeting =  Appointment(name: "bob", day: "Fri", place: "KFC")
    beerMeeting.printDetails(who: "mary")

    var workMeeting = beerMeeting
    
    workMeeting.name = "Alice"
    workMeeting.day = "Fri"
    workMeeting.place = "Conference RM 2"
    
    beerMeeting.printDetails(who: "social")
    workMeeting.printDetails(who: "work")
    
    
    
}

//---------------------------------------------------------

//---> class  , 使用类创建的对象属于引用类型

class Appointment_CC {
    var name : String
    var day : String
    var place : String
    
    init(name: String,  day : String , place : String)
    {
        self.name = name
        self.day = day
        self.place = place
    }
    
    func printDetails(label: String) -> Void {
        print("\(label) and \(self.name) on \(self.day) at \(self.place) do something")
    }
    
    
}

func testAppointment_CC ()
{
    var beerMeeting =    Appointment_CC(name: "bob", day: "Fri", place: "KFC")
    beerMeeting.printDetails(label:  "mary")
    
    var workMeeting = beerMeeting
    
    workMeeting.name = "Alice"
    workMeeting.day = "Fri"
    workMeeting.place = "Conference RM 2"
    
    beerMeeting.printDetails(label: "social")
    workMeeting.printDetails(label: "work")
    
//out put
//    mary and bob on Fri at KFC do something
//    social and Alice on Fri at Conference RM 2 do something
//    work and Alice on Fri at Conference RM 2 do something
}


//---------------------------------------------------------


// 实现NSCopying 协议

class Appointment_CC_NN :  NSObject, NSCopying {
    
    var name : String
    var day : String
    var place : String
    
    init(name: String,  day : String , place : String)
    {
        self.name = name
        self.day = day
        self.place = place
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Appointment_CC_NN(name: self.name, day: self.day, place: self.place)
    }
    
    func printDetails(label: String) -> Void {
        print("\(label) and \(self.name) on \(self.day) at \(self.place) do something")
    }
    
    
}

func testAppointment_CC_NN ()
{
    var beerMeeting =    Appointment_CC_NN(name: "bob", day: "Fri", place: "KFC")
    beerMeeting.printDetails(label:  "mary")
    
    var workMeeting = beerMeeting.copy() as! Appointment_CC_NN
    
    workMeeting.name = "Alice"
    workMeeting.day = "Fri"
    workMeeting.place = "Conference RM 2"
    
    beerMeeting.printDetails(label: "social")
    workMeeting.printDetails(label: "work")
    
//output
//    mary and bob on Fri at KFC do something
//    social and bob on Fri at KFC do something
//    work and Alice on Fri at Conference RM 2 do something
}

//---------------------------------------------------------

class Location {
    var name: String
    var address : String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

class Appointment_CC_NN_L :  NSObject, NSCopying {
    
    var name : String
    var day : String
//    var place : String
    var place : Location
    
    init(name: String,  day : String , place : Location)
    {
        self.name = name
        self.day = day
        self.place = place
        
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Appointment_CC_NN_L(name: self.name, day: self.day, place: self.place) //浅复制
    }
    
    func printDetails(label: String) -> Void {
        print("\(label) and \(self.name) on \(self.day) at \(self.place.name) ---  \(self.place.address)  do something")
    }
    
    
}

func testAppointment_CC_NN_L ()
{
    var beerMeeting =    Appointment_CC_NN_L(name: "bob", day: "Fri", place: Location(name: "Joe's bar", address: "123 main street"))
    beerMeeting.printDetails(label:  "mary")
    
    var workMeeting = beerMeeting.copy() as! Appointment_CC_NN_L
    
    workMeeting.name = "Alice"
    workMeeting.day = "Fri"
    //workMeeting.place = Location(name: "fefe", address: "copmy")
    workMeeting.place.name = "feffe"
    workMeeting.place.address = "company"
    
    beerMeeting.printDetails(label: "social")
    workMeeting.printDetails(label: "work")
    
    //output
    
}

//---------------------------------------------------------


class Location_N :NSObject,NSCopying {  //❤️ 没有 NSObject 也可以
    var name: String
    var address : String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return  Location_N(name: self.name, address: self.address)
    }
    
}

class Appointment_CC_NN_LN :  NSObject, NSCopying {
    
    var name : String
    var day : String
    //    var place : String
    var place : Location_N
    
    init(name: String,  day : String , place : Location_N)
    {
        self.name = name
        self.day = day
        self.place = place
        
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Appointment_CC_NN_LN(name: self.name, day: self.day, place: self.place.copy() as! Location_N) //深复制
    }
    
    func printDetails(label: String) -> Void {
        print("\(label) and \(self.name) on \(self.day) at \(self.place.name) ---  \(self.place.address)  do something")
    }
    
    
}

func testAppointment_CC_NN_LN ()
{
    var beerMeeting =    Appointment_CC_NN_LN(name: "bob", day: "Fri", place: Location_N(name: "Joe's bar", address: "123 main street"))
    beerMeeting.printDetails(label:  "mary")
    
    var workMeeting = beerMeeting.copy() as! Appointment_CC_NN_LN
    
    workMeeting.name = "Alice"
    workMeeting.day = "Fri"
    //workMeeting.place = Location(name: "fefe", address: "copmy")
    workMeeting.place.name = "feffe"
    workMeeting.place.address = "company"
    
    beerMeeting.printDetails(label: "social")
    workMeeting.printDetails(label: "work")
    
    //output
    
}

