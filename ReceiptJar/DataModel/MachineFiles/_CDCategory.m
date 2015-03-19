// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDCategory.m instead.

#import "_CDCategory.h"

const struct CDCategoryAttributes CDCategoryAttributes = {
	.color = @"color",
	.name = @"name",
	.symbolLetter = @"symbolLetter",
};

const struct CDCategoryRelationships CDCategoryRelationships = {
	.expenses = @"expenses",
};

@implementation CDCategoryID
@end

@implementation _CDCategory

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDCategory" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDCategory";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDCategory" inManagedObjectContext:moc_];
}

- (CDCategoryID*)objectID {
	return (CDCategoryID*)[super objectID];
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

