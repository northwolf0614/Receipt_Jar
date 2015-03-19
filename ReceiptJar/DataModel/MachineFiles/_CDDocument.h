// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDDocument.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDDocumentAttributes {
	__unsafe_unretained NSString *file;
} CDDocumentAttributes;

extern const struct CDDocumentRelationships {
	__unsafe_unretained NSString *receipt;
} CDDocumentRelationships;

@class CDReceipt;

@interface CDDocumentID : NSManagedObjectID {}
@end

@interface _CDDocument : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDDocumentID* objectID;

@property (nonatomic, strong) NSData* file;

//- (BOOL)validateFile:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) CDReceipt *receipt;

//- (BOOL)validateReceipt:(id*)value_ error:(NSError**)error_;

@end

@interface _CDDocument (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveFile;
- (void)setPrimitiveFile:(NSData*)value;

- (CDReceipt*)primitiveReceipt;
- (void)setPrimitiveReceipt:(CDReceipt*)value;

@end
