#import "_CDExpense.h"

@interface CDExpense : _CDExpense {}

+ (NSArray*)sortedExpenseByAttribute:(NSString*)attribute ascending:(BOOL)ascending inManagedObjectContext:(NSManagedObjectContext*)moc;
@end
