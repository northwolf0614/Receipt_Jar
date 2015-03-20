#import "CDType.h"

@interface CDType ()

// Private interface goes here.

@end

@implementation CDType

// Custom logic goes here.
+ (instancetype)typeWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)moc{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    fetchRequest.fetchLimit = 1;
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K = %@", CDTypeAttributes.name, name]];
    NSError *error = nil;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects.count > 0 ? fetchedObjects[0] : nil;
}
@end
