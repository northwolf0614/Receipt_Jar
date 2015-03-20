// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDType.m instead.

#import "_CDType.h"

const struct CDTypeAttributes CDTypeAttributes = {
	.color = @"color",
	.name = @"name",
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

	return keyPaths;
}

@dynamic color;

@dynamic name;

@dynamic symbolLetter;

@dynamic expenses;

- (NSMutableSet*)expensesSet {
	[self willAccessValueForKey:@"expenses"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"expenses"];

	[self didAccessValueForKey:@"expenses"];
	return result;
}

@end

