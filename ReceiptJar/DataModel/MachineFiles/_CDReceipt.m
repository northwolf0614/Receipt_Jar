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

- (NSMutableSet*)documentsSet {
	[self willAccessValueForKey:@"documents"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"documents"];

	[self didAccessValueForKey:@"documents"];
	return result;
}

@dynamic expense;

@end

