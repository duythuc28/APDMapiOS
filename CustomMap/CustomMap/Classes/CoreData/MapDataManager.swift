//
//  MapDataManager.swift
//  CustomMap
//
//  Created by IOSDev on 1/28/16.
//  Copyright © 2016 ALP. All rights reserved.
//

import UIKit

class MapDataManager: NSObject {
    static let sharedInstance = MapDataManager()
    
    let context = BaseCoreDataManager.sharedInstance.managedObjectContext
    
    func insertData (location:LocationData) {
        let locationData = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: context)
        locationData.setValue(location.locationID, forKey: "locationID")
        locationData.setValue(location.locationName, forKey: "locationName")
        do {
            try context.save()
        } catch let error as NSError {
            print ("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func getAllData () -> [Location] {
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: context)
        do {
            let result = try context.executeFetchRequest(fetchRequest)
            return result as! [Location]
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return []
    }
    
    func removeAllData () {
        let array = self.getAllData()
        for location in array {
            let removeLocation = location
            context.deleteObject(removeLocation)
        }
        do {
            try context.save()
        } catch {
            let saveError = error as NSError
            print(saveError)
        }
    }
    
}
