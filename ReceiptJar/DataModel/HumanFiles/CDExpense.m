#import "CDExpense.h"

@interface CDExpense ()

// Private interface goes here.

@end

@implementation CDExpense

// Custom logic goes here.
+ (NSArray*)sortedExpenseByAttribute:(NSString *)attribute ascending:(BOOL)ascending inManagedObjectContext:(NSManagedObjectContext *)moc{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[self entityName]];
    fetchRequest.fetchBatchSize = 100;
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:attribute ascending:ascending];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    return fetchedObjects;
}
@end
