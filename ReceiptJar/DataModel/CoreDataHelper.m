//
//  CoreDataHelper.m
//  ReceiptJar
//
//  Created by Lei Zhao on 20/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "CoreDataHelper.h"
#import "CoreDataEntityHeaders.h"

@implementation CoreDataHelper{
    NSManagedObjectContext* _managedObjectContext;
    NSManagedObjectModel* _managedObjectModel;
    NSPersistentStoreCoordinator* _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.funkytonic.ReceiptJar" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ReceiptJar" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ReceiptJar.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)moc {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.moc;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Test Data

- (void)loadTestData{
    NSDictionary* plist = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TestData" ofType: @"plist"]];
    
    //Types
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[CDType entityName] inManagedObjectContext:self.moc];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.moc executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count == 0) {
        [plist[@"types"] enumerateObjectsUsingBlock:^(NSDictionary* t, NSUInteger idx, BOOL* stop){
            CDType* type = [CDType insertInManagedObjectContext:self.moc];
            type.name = t[CDTypeAttributes.name];
            type.symbolLetter = t[CDTypeAttributes.symbolLetter];
            type.color = [[UIColor alloc] initWithString:t[CDTypeAttributes.color]];
            type.sortIndexValue = [t[CDTypeAttributes.sortIndex] intValue];
        }];
        [self saveContext];
    }
    
    //Deduction Category
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[CDDeductionCategory entityName]];
    fetchedObjects = [self.moc executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count == 0) {
        [plist[@"deductCats"] enumerateObjectsUsingBlock:^(NSDictionary* t, NSUInteger idx, BOOL* stop){
            CDDeductionCategory* cat = [CDDeductionCategory insertInManagedObjectContext:self.moc];
            cat.name = t[CDDeductionCategoryAttributes.name];
            cat.color = [[UIColor alloc] initWithString:t[CDDeductionCategoryAttributes.color]];
        }];
        [self saveContext];
    }
    
    //Expense
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[CDExpense entityName]];
    fetchedObjects = [self.moc executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count == 0) {
        [plist[@"expenses"] enumerateObjectsUsingBlock:^(NSDictionary* e, NSUInteger idx, BOOL* stop){
            CDExpense* exp = [CDExpense insertInManagedObjectContext:self.moc];
            exp.date = [e[CDExpenseAttributes.date] dateValueAsFormat:nil];
            exp.location = e[CDExpenseAttributes.location];
            exp.longDesc = e[CDExpenseAttributes.longDesc];
            exp.shortDesc = e[CDExpenseAttributes.shortDesc];
            exp.title = e[CDExpenseAttributes.title];
            exp.totalAmount = e[CDExpenseAttributes.totalAmount];
            exp.deductCategory = [CDDeductionCategory categoryWithName:e[CDExpenseRelationships.deductCategory] inManagedObjectContext:self.moc];
            exp.type = [CDType typeWithName:e[CDExpenseRelationships.type] inManagedObjectContext:self.moc];
        }];
        [self saveContext];
    }

}

@end
