//
//  AccountInvoker.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/22/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation

class AccountInvoker: NSObject {
    
    static func signIn(signInParam: NSObject, completion: (result: AccountModel?, error: RESTError?) -> Void) {
        let request = RESTRequest.init(subPath: "user", functionName: "sign-in")
        
        request.basePOST(signInParam) { (result, error) -> Void in
            
            let responseAccount: AccountModel = ObjectMapper.sharedInstance().objectFromSource(result, toInstanceOfClass: AccountModel.self) as! AccountModel
 
            completion(result: responseAccount, error: error)
        }
    }
}