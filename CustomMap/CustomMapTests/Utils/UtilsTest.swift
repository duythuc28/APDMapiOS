//
//  UtilsTest.swift
//  CustomMap
//
//  Created by IOSDev on 1/28/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import XCTest
@testable import CustomMap

class UtilsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testInsertNilString () {
        let testString : String?
        testString = nil
        XCTAssertEqual("", String.checkNilValue(testString), "Error")
    }
    
    func testInsertNotNilString () {
        let testString : String?
        testString = "abcdef"
        XCTAssertEqual("abcdef", String.checkNilValue(testString), "Error")
    }
    
    func testAssignStringWithOptionalString () {
        let testString : String?
        let optionalString : String?
        optionalString = nil
        testString = optionalString
        print ("Test String \(String.checkNilValue(testString))")
        XCTAssertEqual("",String.checkNilValue(testString) , "Error")
    }

}
