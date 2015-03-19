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
};

const struct CDExpenseRelationships CDExpenseRelationships = {
	.category = @"category",
	.group = @"group",
	.receipts = @"receipts",
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

@dynamic category;

@dynamic group;

@dynamic receipts;

- (NSMutableSet*)receiptsSet {
	[self willAccessValueForKey:@"receipts"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"receipts"];

	[self didAccessValueForKey:@"receipts"];
	return result;
}

@end
