//
//  MapDataManagerTests.swift
//  CustomMap
//
//  Created by IOSDev on 1/28/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import XCTest
@testable import CustomMap
class MapDataManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        

    }
    
    func testInsertData () {
        MapDataManager.sharedInstance.removeAllData()
        let locationData = LocationData(locationID: 1, locationName: "Test loc")
        MapDataManager.sharedInstance.insertData(locationData)
        let locationArray = MapDataManager.sharedInstance.getAllData()
        print ("Location Name \((locationArray[0].locationName!))")
        XCTAssertEqual("Test loc", locationArray[0].locationName!)
    }
    
    func testInsertNilData () {
        MapDataManager.sharedInstance.removeAllData()
        let locationData = LocationData(locationID: 1, locationName:nil)
        MapDataManager.sharedInstance.insertData(locationData)
        let locationArray = MapDataManager.sharedInstance.getAllData()
        print ("Location Name \((locationArray[0].locationName!))")
        XCTAssertNotEqual("Test loc", locationArray[0].locationName!)
    }
    
    func testGetInsertData () {
        MapDataManager.sharedInstance.removeAllData()
        for index in 1...5 {
            let locationData = LocationData(locationID: index, locationName:"Test \(index)")
            MapDataManager.sharedInstance.insertData(locationData)
        }
        let locationArray = MapDataManager.sharedInstance.getAllData()
        XCTAssertEqual("Test 1", locationArray[0].locationName!)
        XCTAssertEqual("Test 2", locationArray[1].locationName!)
        XCTAssertEqual("Test 3", locationArray[2].locationName!)
        XCTAssertEqual("Test 4", locationArray[3].locationName!)
        XCTAssertEqual("Test 5", locationArray[4].locationName!)
    }
    
    func testGetEmptyArray () {
        MapDataManager.sharedInstance.removeAllData()
        let locationArray = MapDataManager.sharedInstance.getAllData()
        XCTAssertEqual([], locationArray, "Error")
    }
}
