//
//  Account.swift
//  QuikLink
//
//  Created by Mitali Chandna on 2015-11-28.
//  Copyright © 2015 Mitali Chandna. All rights reserved.
//

import UIKit

class Account : NSObject, NSCoding {
    
    //MARK: Properties 
    
    var name: String //Facebook, Twitter
    var loginID: String
    var loggedIn: Bool
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("accounts")
    
    //MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let loginIDKey = "loginID"
        static let loggedInKey = "loggedIn"
    }
    
    //MARK: Initializions
    
    init(name: String, loginID: String, loggedIn: Bool) {
        self.name = name
        self.loginID = loginID
        self.loggedIn = loggedIn
        
        //All cases where initialization could fail are checked before this object is made
        super.init()
        
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(loginID, forKey: PropertyKey.loginIDKey)
        aCoder.encodeBool(loggedIn, forKey: PropertyKey.loggedInKey)
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let nameObject = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let loginIDObject = aDecoder.decodeObjectForKey(PropertyKey.loginIDKey) as! String
        let loggedInObject = aDecoder.decodeBoolForKey(PropertyKey.loggedInKey)
        
        self.init(name: nameObject, loginID: loginIDObject, loggedIn: loggedInObject)
    }
}
