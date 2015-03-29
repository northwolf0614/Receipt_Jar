// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDDeductionCategory.m instead.

#import "_CDDeductionCategory.h"

const struct CDDeductionCategoryAttributes CDDeductionCategoryAttributes = {
	.color = @"color",
	.name = @"name",
	.sortIndex = @"sortIndex",
};

const struct CDDeductionCategoryRelationships CDDeductionCategoryRelationships = {
	.expenses = @"expenses",
};

@implementation CDDeductionCategoryID
@end

@implementation _CDDeductionCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDDeductionCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDDeductionCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDDeductionCategory" inManagedObjectContext:moc_];
}

- (CDDeductionCategoryID*)objectID {
	return (CDDeductionCategoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"sortIndexValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sortIndex"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic color;

@dynamic name;

@dynamic sortIndex;

- (int32_t)sortIndexValue {
	NSNumber *result = [self sortIndex];
	return [result intValue];
}

- (void)setSortIndexValue:(int32_t)value_ {
	[self setSortIndex:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSortIndexValue {
	NSNumber *result = [self primitiveSortIndex];
	return [result intValue];
}

- (void)setPrimitiveSortIndexValue:(int32_t)value_ {
	[self setPrimitiveSortIndex:[NSNumber numberWithInt:value_]];
}

@dynamic expenses;

- (NSMutableSet*)expensesSet {
	[self willAccessValueForKey:@"expenses"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"expenses"];

	[self didAccessValueForKey:@"expenses"];
	return result;
}

@end

