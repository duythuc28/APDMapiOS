//
//  ChildNodeParam.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/22/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import Foundation

class ChildNodeParam: NSObject {
    var firstName: String = ""
    var lastName: String = ""
    
    init(lastName: String, firstName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}