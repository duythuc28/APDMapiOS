//
//  LocationData.swift
//  CustomMap
//
//  Created by IOSDev on 1/28/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import UIKit

class LocationData: NSObject {
    
    var locationID = 0
    var locationName = ""
    
    init(locationID:Int, locationName:String?) {
        super.init()
        self.locationID = locationID
        self.locationName = String.checkNilValue(locationName)
    }
}
