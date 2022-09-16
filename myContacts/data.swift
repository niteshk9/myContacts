//
//  data.swift
//  myContacts
//
//  Created by Nitesh Kumar Singh on 05/09/22.
//

import Foundation

class Contacts {
    var firstName : String
    var lastName : String
    var phoneNumber : String
    var email : String
    
    init(firstName : String, lastName : String, phoneNumber : String, email : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        
    }
    
    func display() {
        print(self.firstName)
    }
}


var myContacts : [Contacts] = [
    .init(firstName: "Nitesh", lastName: "Kumar", phoneNumber: "9785468754", email: "nitesh@gmail.com"),
    .init(firstName: "Rohit", lastName: "Kumar", phoneNumber: "7584987833", email: "rohit11@gmail.com"),
    .init(firstName: "Shivam", lastName: "Sharma", phoneNumber: "8763728374", email: "sharmashivam@gmail.com"),
    .init(firstName: "Aman", lastName: "Arora", phoneNumber: "9485746374", email: "amanarr@gmail.com"),
    .init(firstName: "Aditya", lastName: "", phoneNumber: "9987584738", email: "aditya888@gmail.com"),
    .init(firstName: "Sachin", lastName: "Singh", phoneNumber: "9876567865", email: "sachinyad@gmail.com"),
    .init(firstName: "Tanisha", lastName: "Kumari", phoneNumber: "9989765456", email: "tgoyal@gmail.com"),
    .init(firstName: "Karishma", lastName: "Jaisawal", phoneNumber: "7867535676", email: "karishma998@gmail.com"),
    .init(firstName: "Yash", lastName: "", phoneNumber: "6787656787", email: "yash44646@gmail.com"),
    .init(firstName: "Nikhil", lastName: "Kher", phoneNumber: "9878776787", email: "nikhilku@gmail.com"),
    .init(firstName: "Jasmine", lastName: "", phoneNumber: "9867546755", email: "jas787587@gmail.com"),
    .init(firstName: "Ishaan", lastName: "K", phoneNumber: "9846457586", email: "ish66@gmail.com"),
    .init(firstName: "Kevin", lastName: "D", phoneNumber: "7594837289", email: "dk8585@gmail.com")
]
var allContacts = myContacts.sorted(by: {$0.firstName < $1.firstName})

//var contactDict = [Character : [Contacts]]()
var contactDict : [String : [Contacts]] = {
    var contactD = [String : [Contacts]]()
    for contact in allContacts {
    
        let firstCharacter = String(contact.firstName.first!)
    
        if contactD[firstCharacter] != nil {
            contactD[firstCharacter]!.append(contact)
        } else {
            contactD[firstCharacter] = [contact]
        }
    }
    return contactD
}()
