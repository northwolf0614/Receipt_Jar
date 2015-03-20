#import "_CDDeductionCategory.h"

@interface CDDeductionCategory : _CDDeductionCategory {}

+ (instancetype)categoryWithName:(NSString*)name inManagedObjectContext:(NSManagedObjectContext*)moc;
@end
