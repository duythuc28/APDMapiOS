//
//  RESTMultipart.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/21/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation

class RESTMultipart: NSObject {
    
    var name: String! = ""
    var contentType: String! = ""
    var data: NSData!
    
    init(name: String!, contentType: String!, data: NSData!) {
        self.name = name
        self.contentType = contentType
        self.data = data
    }
    
    func getHeader() -> NSMutableDictionary {
        let header = NSMutableDictionary()
        
        header.setValue("form-data; name=" + self.name, forKey: "Content-Disposition")
        header.setValue(self.contentType, forKey: "Content-Type")
        
        return header
    }
    
    class JSONPart: RESTMultipart {
//        init(name: String!, jsonObject: NSObject) {
//            let data: NSData! = NSKeyedArchiver.archivedDataWithRootObject(ObjectMapper.sharedInstance().dictionaryFromObject(jsonObject))
//            
//            super.init(name: name, contentType: "application/json; charset=UTF-8", data: data)
//        }
    }
    
    class FilePart: RESTMultipart {
        
        var fileName: String!
        
        init(name: String!, fileName: String!, data: NSData!) {
            super.init(name: name, contentType: "application/octet-stream", data: data)
            self.fileName = fileName
        }
        
        override func getHeader() -> NSMutableDictionary {
            let header = super.getHeader()
            header.setValue("form-data; name=" + self.name + ";" +
                "filename=" + self.fileName, forKey: "Content-Disposition")
            
            return header
        }
    }
}