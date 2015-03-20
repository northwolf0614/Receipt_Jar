// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDDeductionCategory.m instead.

#import "_CDDeductionCategory.h"

const struct CDDeductionCategoryAttributes CDDeductionCategoryAttributes = {
	.color = @"color",
	.name = @"name",
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

