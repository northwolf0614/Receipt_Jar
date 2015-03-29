//
//  MYManagedObject.m
//  ReceiptJar
//
//  Created by Lei Zhao on 19/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "MYManagedObject.h"

@implementation MYManagedObject

+ (NSString*)entityName{
    abort();
}

+ (NSArray*)fetchAllWithSortDescriptors:(NSArray *)sortDescriptors inManagedObjectContext:(NSManagedObjectContext *)moc{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    
    if (sortDescriptors) {
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    NSError *error = nil;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}

@end
