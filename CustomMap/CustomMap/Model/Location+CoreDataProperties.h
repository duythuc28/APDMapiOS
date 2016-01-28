//
//  Location+CoreDataProperties.h
//  CustomMap
//
//  Created by IOSDev on 1/28/16.
//  Copyright © 2016 ALP. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface Location (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *locationID;
@property (nullable, nonatomic, retain) NSString *locationName;
@property (nullable, nonatomic, retain) NSString *locationDescription;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;

@end

NS_ASSUME_NONNULL_END
