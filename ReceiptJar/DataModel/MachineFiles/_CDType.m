// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDType.m instead.

#import "_CDType.h"

const struct CDTypeAttributes CDTypeAttributes = {
	.color = @"color",
	.name = @"name",
	.sortIndex = @"sortIndex",
	.symbolLetter = @"symbolLetter",
};

const struct CDTypeRelationships CDTypeRelationships = {
	.expenses = @"expenses",
};

@implementation CDTypeID
@end

@implementation _CDType

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDType" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDType";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDType" inManagedObjectContext:moc_];
}

- (CDTypeID*)objectID {
	return (CDTypeID*)[super objectID];
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

@dynamic symbolLetter;

@dynamic expenses;

- (NSMutableSet*)expensesSet {
	[self willAccessValueForKey:@"expenses"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"expenses"];

	[self didAccessValueForKey:@"expenses"];
	return result;
}

@end

