//
//  RESTContants.swift
//  SwiftCore
//
//  Created by MacMini on 9/18/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation

class RESTContants: NSObject {
    
    //MARK: RESTRequest Header Keys
    static let kDefineRESTRequestHeaderKey              = "Header"
    static let kDefineRESTRequestAuthorizationKey       = "Authorization"
    static let kDefineRESTRequestContentTypeKey         = "Content-Type"
    static let kDefineRESTRequestAcceptKey              = "Accept"
    
    //MARK: Keys for parser
    static let kDefineSuccessKeyFromResponseData        = "status"
    static let kDefineMessageKeyFromResponseData        = "msg"
    static let kDefineDefaultMessageKeyFromResponseData = "unknow_error"
    
    //MARK: Prepairing request
    static let kDefineRequestTimeOut                    = 90.0
    
    //MARK: Webservice url
    static let kDefineWebserviceUrl                     = "http://drdvietnam.org/bandotiepcan/api/"
    static let kDefineWebserviceResourceUrl             = ""
}

extension RESTRequest {
    
    static func checkSuccessFromResponseData(responseData: NSData?) -> Bool {
        if(responseData?.length == 0) {
            return false
        }
        
//        let jsonObj: JSON = JSON(data: responseData!)
//        if(jsonObj != nil)
//        {
//            let isSuccess: Bool = jsonObj[RESTContants.kDefineSuccessKeyFromResponseData].boolValue
//            
//            return isSuccess
//        }
        
        
        return false
    }
}

enum RESTRequestBodyType {
    case JSON
    case Form
}

enum RESTRequestMethod {
    case GET, POST, PUT, DELETE
}