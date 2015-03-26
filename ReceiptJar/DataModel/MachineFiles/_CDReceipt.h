// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDReceipt.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDReceiptAttributes {
	__unsafe_unretained NSString *rawData;
} CDReceiptAttributes;

extern const struct CDReceiptRelationships {
	__unsafe_unretained NSString *documents;
	__unsafe_unretained NSString *expense;
} CDReceiptRelationships;

@class CDDocument;
@class CDExpense;

@class NSDictionary;

@interface CDReceiptID : NSManagedObjectID {}
@end

@interface _CDReceipt : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDReceiptID* objectID;

@property (nonatomic, strong) NSDictionary* rawData;

//- (BOOL)validateRawData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *documents;

- (NSMutableSet*)documentsSet;

@property (nonatomic, strong) CDExpense *expense;

//- (BOOL)validateExpense:(id*)value_ error:(NSError**)error_;

@end

@interface _CDReceipt (DocumentsCoreDataGeneratedAccessors)
- (void)addDocuments:(NSSet*)value_;
- (void)removeDocuments:(NSSet*)value_;
- (void)addDocumentsObject:(CDDocument*)value_;
- (void)removeDocumentsObject:(CDDocument*)value_;

@end

@interface _CDReceipt (CoreDataGeneratedPrimitiveAccessors)

- (NSDictionary*)primitiveRawData;
- (void)setPrimitiveRawData:(NSDictionary*)value;

- (NSMutableSet*)primitiveDocuments;
- (void)setPrimitiveDocuments:(NSMutableSet*)value;

- (CDExpense*)primitiveExpense;
- (void)setPrimitiveExpense:(CDExpense*)value;

@end
