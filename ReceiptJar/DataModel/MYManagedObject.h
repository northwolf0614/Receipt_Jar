//
//  MYManagedObject.h
//  ReceiptJar
//
//  Created by Lei Zhao on 19/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface MYManagedObject : NSManagedObject

+ (NSString*)entityName;
+ (NSArray*)fetchAllWithSortDescriptors:(NSArray*)sortDescriptors inManagedObjectContext:(NSManagedObjectContext*)moc;
@end
