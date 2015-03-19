//
//  CoreDataHelper.h
//  ReceiptJar
//
//  Created by Lei Zhao on 20/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <iOS_Utility/iOS_Utility.h>

@interface CoreDataHelper : Singleton
@property(nonatomic, readonly)NSManagedObjectContext* moc;

- (void)save;
@end
