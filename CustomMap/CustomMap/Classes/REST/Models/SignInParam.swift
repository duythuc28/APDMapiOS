//
//  SignInParam.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/21/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation

class SignInParam: NSObject {
    var email: String = ""
    var password: String = ""
    var accessToken: String = ""
    var refreshToken: String = ""
    var provider: String = ""
    var childParam: ChildNodeParam?
    
    init(child: ChildNodeParam) {
        self.childParam = child
    }
}