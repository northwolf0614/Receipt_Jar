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

@property (nonatomic, strong) NSOrderedSet *documents;

- (NSMutableOrderedSet*)documentsSet;

@property (nonatomic, strong) CDExpense *expense;

//- (BOOL)validateExpense:(id*)value_ error:(NSError**)error_;

@end

@interface _CDReceipt (DocumentsCoreDataGeneratedAccessors)
- (void)addDocuments:(NSOrderedSet*)value_;
- (void)removeDocuments:(NSOrderedSet*)value_;
- (void)addDocumentsObject:(CDDocument*)value_;
- (void)removeDocumentsObject:(CDDocument*)value_;

- (void)insertObject:(CDDocument*)value inDocumentsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDocumentsAtIndex:(NSUInteger)idx;
- (void)insertDocuments:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDocumentsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDocumentsAtIndex:(NSUInteger)idx withObject:(CDDocument*)value;
- (void)replaceDocumentsAtIndexes:(NSIndexSet *)indexes withDocuments:(NSArray *)values;

@end

@interface _CDReceipt (CoreDataGeneratedPrimitiveAccessors)

- (NSDictionary*)primitiveRawData;
- (void)setPrimitiveRawData:(NSDictionary*)value;

- (NSMutableOrderedSet*)primitiveDocuments;
- (void)setPrimitiveDocuments:(NSMutableOrderedSet*)value;

- (CDExpense*)primitiveExpense;
- (void)setPrimitiveExpense:(CDExpense*)value;

@end
