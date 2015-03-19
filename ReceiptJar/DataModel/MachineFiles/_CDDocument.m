// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDDocument.m instead.

#import "_CDDocument.h"

const struct CDDocumentAttributes CDDocumentAttributes = {
	.file = @"file",
};

const struct CDDocumentRelationships CDDocumentRelationships = {
	.receipt = @"receipt",
};

@implementation CDDocumentID
@end

@implementation _CDDocument

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDDocument" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDDocument";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDDocument" inManagedObjectContext:moc_];
}

- (CDDocumentID*)objectID {
	return (CDDocumentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic file;

@dynamic receipt;

@end

