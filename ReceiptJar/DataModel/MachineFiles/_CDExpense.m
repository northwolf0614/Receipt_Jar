// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDExpense.m instead.

#import "_CDExpense.h"

const struct CDExpenseAttributes CDExpenseAttributes = {
	.date = @"date",
	.gst = @"gst",
	.location = @"location",
	.longDesc = @"longDesc",
	.shortDesc = @"shortDesc",
	.title = @"title",
	.totalAmount = @"totalAmount",
	.workRelatedPortion = @"workRelatedPortion",
};

const struct CDExpenseRelationships CDExpenseRelationships = {
	.deductCategory = @"deductCategory",
	.receipts = @"receipts",
	.type = @"type",
};

@implementation CDExpenseID
@end

@implementation _CDExpense

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDExpense" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDExpense";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDExpense" inManagedObjectContext:moc_];
}

- (CDExpenseID*)objectID {
	return (CDExpenseID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"gstValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gst"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"totalAmountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"totalAmount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"workRelatedPortionValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"workRelatedPortion"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic date;

@dynamic gst;

- (float)gstValue {
	NSNumber *result = [self gst];
	return [result floatValue];
}

- (void)setGstValue:(float)value_ {
	[self setGst:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveGstValue {
	NSNumber *result = [self primitiveGst];
	return [result floatValue];
}

- (void)setPrimitiveGstValue:(float)value_ {
	[self setPrimitiveGst:[NSNumber numberWithFloat:value_]];
}

@dynamic location;

@dynamic longDesc;

@dynamic shortDesc;

@dynamic title;

@dynamic totalAmount;

- (float)totalAmountValue {
	NSNumber *result = [self totalAmount];
	return [result floatValue];
}

- (void)setTotalAmountValue:(float)value_ {
	[self setTotalAmount:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTotalAmountValue {
	NSNumber *result = [self primitiveTotalAmount];
	return [result floatValue];
}

- (void)setPrimitiveTotalAmountValue:(float)value_ {
	[self setPrimitiveTotalAmount:[NSNumber numberWithFloat:value_]];
}

@dynamic workRelatedPortion;

- (float)workRelatedPortionValue {
	NSNumber *result = [self workRelatedPortion];
	return [result floatValue];
}

- (void)setWorkRelatedPortionValue:(float)value_ {
	[self setWorkRelatedPortion:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveWorkRelatedPortionValue {
	NSNumber *result = [self primitiveWorkRelatedPortion];
	return [result floatValue];
}

- (void)setPrimitiveWorkRelatedPortionValue:(float)value_ {
	[self setPrimitiveWorkRelatedPortion:[NSNumber numberWithFloat:value_]];
}

@dynamic deductCategory;

@dynamic receipts;

- (NSMutableOrderedSet*)receiptsSet {
	[self willAccessValueForKey:@"receipts"];

	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"receipts"];

	[self didAccessValueForKey:@"receipts"];
	return result;
}

@dynamic type;

@end

@implementation _CDExpense (ReceiptsCoreDataGeneratedAccessors)
- (void)addReceipts:(NSOrderedSet*)value_ {
	[self.receiptsSet unionOrderedSet:value_];
}
- (void)removeReceipts:(NSOrderedSet*)value_ {
	[self.receiptsSet minusOrderedSet:value_];
}
- (void)addReceiptsObject:(CDReceipt*)value_ {
	[self.receiptsSet addObject:value_];
}
- (void)removeReceiptsObject:(CDReceipt*)value_ {
	[self.receiptsSet removeObject:value_];
}
- (void)insertObject:(CDReceipt*)value inReceiptsAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"receipts"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self receipts]];
    [tmpOrderedSet insertObject:value atIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"receipts"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"receipts"];
}
- (void)removeObjectFromReceiptsAtIndex:(NSUInteger)idx {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"receipts"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self receipts]];
    [tmpOrderedSet removeObjectAtIndex:idx];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"receipts"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"receipts"];
}
- (void)insertReceipts:(NSArray *)value atIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"receipts"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self receipts]];
    [tmpOrderedSet insertObjects:value atIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"receipts"];
    [self didChange:NSKeyValueChangeInsertion valuesAtIndexes:indexes forKey:@"receipts"];
}
- (void)removeReceiptsAtIndexes:(NSIndexSet *)indexes {
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"receipts"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self receipts]];
    [tmpOrderedSet removeObjectsAtIndexes:indexes];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"receipts"];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:indexes forKey:@"receipts"];
}
- (void)replaceObjectInReceiptsAtIndex:(NSUInteger)idx withObject:(CDReceipt*)value {
    NSIndexSet* indexes = [NSIndexSet indexSetWithIndex:idx];
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"receipts"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self receipts]];
    [tmpOrderedSet replaceObjectAtIndex:idx withObject:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"receipts"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"receipts"];
}
- (void)replaceReceiptsAtIndexes:(NSIndexSet *)indexes withReceipts:(NSArray *)value {
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"receipts"];
    NSMutableOrderedSet *tmpOrderedSet = [NSMutableOrderedSet orderedSetWithOrderedSet:[self receipts]];
    [tmpOrderedSet replaceObjectsAtIndexes:indexes withObjects:value];
    [self setPrimitiveValue:tmpOrderedSet forKey:@"receipts"];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:indexes forKey:@"receipts"];
}
@end

