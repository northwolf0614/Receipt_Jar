#import "_CDType.h"

@interface CDType : _CDType {}
// Custom logic goes here.

+ (instancetype)typeWithName:(NSString*)name inManagedObjectContext:(NSManagedObjectContext*)moc;
@end
