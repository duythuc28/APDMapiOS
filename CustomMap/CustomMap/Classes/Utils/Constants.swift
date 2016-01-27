//
//  Constants.swift
//  SGDrivers
//
//  Created by Nhan Nguyen on 9/4/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    struct GlobalConstants {
        
        /*********************************************************/
        
        /*********************************************************/
        
        /*********************************************************/
        
        /*********************************************************/
        
        /*********************************************************/
        
        /*********************************************************/
        
        /*********************************************************/
        
        /*********************************************************/
    }
}

extension String {
    
    /*********************************************************/
    // MARK: Web service
    static let kDefineWebServiceAPIUrl              = "TEST"
    static let kDefineWebServiceResourcesUrl        = "TEST"
    
    /*********************************************************/
    // MARK: Font name
    
    static let kDefineFontNameLight  = "OpenSans-Light"
    static let kDefineFontNameNormal = "OpenSans"
    static let kDefineFontNameBold   = "OpenSans-Bold"
    
    /*********************************************************/
    
    /*********************************************************/
    // MARK: Multi language
    
    static func MultiLanguage(key: String) -> String {
           return NSLocalizedString(key, comment: "")
    }
    
    // MARK: Google Map Key
    static let kDefineGoogleMapKey = "AIzaSyATXG0GMu-xGkxQhXEqIe0Tbi8BgAm4G14"
    
    /*********************************************************/
}

extension UIColor {
    class func kDefineDefaultGrayBackgroundColor() -> UIColor {
        return UIColor(red: 234.0/255.0, green: 234.0/255.0, blue: 234.0/255.0, alpha: 1.0)
    }
    
    class func kDefineDefaultRedBackgroundColor() -> UIColor {
        return UIColor(red: 234.0/255.0, green: 44.0/255.0, blue: 62.0/255.0, alpha: 1.0)
    }
}

extension UIFont {
    class func kDefineDefaultFontLight(size: CGFloat) -> UIFont {
        return UIFont (name: String.kDefineFontNameLight, size: size)!
    }
    
    class func kDefineDefaultFontNormal(size: CGFloat) -> UIFont {
        return UIFont (name: String.kDefineFontNameNormal, size: size)!
    }
    
    class func kDefineDefaultFontBold(size: CGFloat) -> UIFont {
        return UIFont (name: String.kDefineFontNameBold, size: size)!
    }
}

extension CGFloat {
    static let kDefineFontSizeNormal: CGFloat = 13.0
    static let kDefineFontSizeTitle: CGFloat  = 15.0
    static let kDefineFontSizeDetail: CGFloat = 11.0
}

extension CGRect {
    static let kDefineHeightOfStatusBar = UIApplication.sharedApplication().statusBarFrame.size.height
    static let kDefineHeightOfMainScreen = UIScreen.mainScreen().bounds.size.height
    static let kDefineWidthOfMainScreen = UIScreen.mainScreen().bounds.size.width
}

extension UIUserInterfaceIdiom {
    
    static let kDefineIDIOM    = UIDevice.currentDevice().userInterfaceIdiom
    
    static let kDefineIsIpad   = { return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad }
    static let kDefineIsIPhone = { return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone }
}

extension UIUserInterfaceIdiom {
    static let kDefineIOSVersion = Int(UIDevice.currentDevice().systemVersion.componentsSeparatedByString(".")[0])
    
}

extension UITableView {
    func registerNib(cell: AnyObject) {
        
        let className = cell.theClassName
        
        let cellNib = UINib(nibName: className, bundle: nil)
        self.registerNib(cellNib, forCellReuseIdentifier: className)
    }
}

extension NSObject {
    var theClassName: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
    
    func getClassName() -> String {
        return self.theClassName
    }
}

extension UITableViewCell {
    
    func setValueForBasicControl(outlets: NSArray, values:NSArray) {
        outlets.enumerateObjectsUsingBlock { (object, Indexable, stop) -> Void in
            
            let obj: AnyObject = object
            let className = obj.theClassName
            if (className.lowercaseString.rangeOfString("label") != nil) {
                let obj: UILabel = object as! UILabel
                obj.text = values[Indexable] as? String
            }
            else if (className.lowercaseString.rangeOfString("button") != nil) {
                let obj: UIButton = object as! UIButton
                obj.setTitle(values[Indexable] as? String, forState: UIControlState.Normal)
            }
            else if (className.lowercaseString.rangeOfString("textfield") != nil) {
                let obj: UITextField = object as! UITextField
                obj.text = values[Indexable] as? String
            }
            else if (className.lowercaseString.rangeOfString("textview") != nil) {
                let obj: UITextView = object as! UITextView
                obj.text = values[Indexable] as? String
            }
            else if (className.lowercaseString.rangeOfString("imageview") != nil) {
                let obj: UIImageView = object as! UIImageView
                obj.image = UIImage(named: (values[Indexable] as? String)!)
            }
        }
    }
}
