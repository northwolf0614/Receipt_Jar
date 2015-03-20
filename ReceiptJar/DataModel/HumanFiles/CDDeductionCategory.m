#import "CDDeductionCategory.h"

@interface CDDeductionCategory ()

// Private interface goes here.

@end

@implementation CDDeductionCategory


+ (instancetype)categoryWithName:(NSString *)name inManagedObjectContext:(NSManagedObjectContext *)moc{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    fetchRequest.fetchLimit = 1;
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K = %@", CDDeductionCategoryAttributes.name, name]];
    NSError *error = nil;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects.count > 0 ? fetchedObjects[0] : nil;
}
@end
