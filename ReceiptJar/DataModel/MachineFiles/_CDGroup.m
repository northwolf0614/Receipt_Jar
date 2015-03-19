// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDGroup.m instead.

#import "_CDGroup.h"

const struct CDGroupAttributes CDGroupAttributes = {
	.color = @"color",
	.name = @"name",
};

const struct CDGroupRelationships CDGroupRelationships = {
	.expenses = @"expenses",
};

@implementation CDGroupID
@end

@implementation _CDGroup

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDGroup" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDGroup";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDGroup" inManagedObjectContext:moc_];
}

- (CDGroupID*)objectID {
	return (CDGroupID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic color;

@dynamic name;

@dynamic expenses;

- (NSMutableSet*)expensesSet {
	[self willAccessValueForKey:@"expenses"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"expenses"];

	[self didAccessValueForKey:@"expenses"];
	return result;
}

@end

