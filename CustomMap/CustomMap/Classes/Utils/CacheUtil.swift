//
//  CacheUtil.swift
//  SGDrivers
//
//  Created by Nhan Nguyen on 9/4/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

import UIKit

class CacheUtil: NSObject {
    static let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    /// For bool value
    class func setBoolValue(value: Bool, forKey: String) {
        userDefaults.setBool(value, forKey: forKey)
        userDefaults.synchronize()
    }
    
    class func getBoolValueForKey(key: String) -> Bool {
        return userDefaults.boolForKey(key)
    }
    
    /**
    *  For integer value
    */
    class func setIntegerValue(value: Int, forkey: String) {
        userDefaults.setInteger(value, forKey: forkey)
        userDefaults.synchronize()
    }
    
    class func getIntegerValueForKey(key: String) -> Int {
        return userDefaults.integerForKey(key)
    }
    
    /**
    *  For double
    */
    class func setDoubleValue(value: Double, forKey: String) {
        userDefaults.setDouble(value, forKey: forKey)
        userDefaults.synchronize()
    }
    
    class func getDoubleValueFroKey(key: String) -> Double {
        return userDefaults.doubleForKey(key)
    }
    
    /**
    *  For floar
    */
    class func setFloatValue(value: Float, forkey: String) {
        userDefaults.setFloat(value, forKey: forkey)
        userDefaults.synchronize()
    }
    
    class func getFloatValueForKey(key: String) -> Float {
       return userDefaults.floatForKey(key)
    }
    
    /**
    *  For object
    */
    class func setObject(object: AnyObject, forKey: String) {
        userDefaults.setObject(object, forKey: forKey)
        userDefaults.synchronize() 
    }
    
    class func getObjectForKey(key: String) -> AnyObject! {
        return userDefaults.objectForKey(key)
    }
}
