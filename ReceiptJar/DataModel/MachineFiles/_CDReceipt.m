// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDReceipt.m instead.

#import "_CDReceipt.h"

const struct CDReceiptAttributes CDReceiptAttributes = {
	.rawData = @"rawData",
};

const struct CDReceiptRelationships CDReceiptRelationships = {
	.documents = @"documents",
	.expense = @"expense",
};

@implementation CDReceiptID
@end

@implementation _CDReceipt

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDReceipt" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDReceipt";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDReceipt" inManagedObjectContext:moc_];
}

- (CDReceiptID*)objectID {
	return (CDReceiptID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic rawData;

@dynamic documents;

- (NSMutableOrderedSet*)documentsSet {
	[self willAccessValueForKey:@"documents"];

	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"documents"];

	[self didAccessValueForKey:@"documents"];
	return result;
}

@dynamic expense;

@end

@implementation _CDReceipt (DocumentsCoreDataGeneratedAccessors)
- (void)addDocuments:(NSOrderedSet*)value_ {
	[self.documentsSet unionOrderedSet:value_];
}
- (void)removeDocuments:(NSOrderedSet*)value_ {
	[self.documentsSet minusOrderedSet:value_];
}
- (void)addDocumentsObject:(CDDocument*)value_ {
	[self.documentsSet addObject:value_];
}
- (void)removeDocumentsObject:(CDDocument*)value_ {
	[self.documentsSet removeObject:value_];
}
- (void)insertObject:(CDDocument*)value inDocumentsAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"documents"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self documents]];
    [tmpOrderedSet insertObject:value atIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"documents"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"documents"];
}
- (void)removeObjectFromDocumentsAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"documents"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self documents]];
    [tmpOrderedSet removeObjectAtIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"documents"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"documents"];
}
- (void)insertDocuments:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"documents"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self documents]];
    [tmpOrderedSet insertObjects:value atIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"documents"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"documents"];
}
- (void)removeDocumentsAtIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"documents"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self documents]];
    [tmpOrderedSet removeObjectsAtIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"documents"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"documents"];
}
- (void)replaceObjectInDocumentsAtIndex:(NSUInteger)idx withObject:(CDDocument*)value {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"documents"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self documents]];
    [tmpOrderedSet replaceObjectAtIndex:idx withObject:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"documents"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"documents"];
}
- (void)replaceDocumentsAtIndexes:(NSIndexSet *)indexes withDocuments:(NSArray *)value {
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"documents"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self documents]];
    [tmpOrderedSet replaceObjectsAtIndexes:indexes withObjects:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"documents"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"documents"];
}
@end

