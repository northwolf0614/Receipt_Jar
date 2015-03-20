// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDExpense.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDExpenseAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *gst;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *longDesc;
	__unsafe_unretained NSString *shortDesc;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *totalAmount;
	__unsafe_unretained NSString *workRelatedPortion;
} CDExpenseAttributes;

extern const struct CDExpenseRelationships {
	__unsafe_unretained NSString *deductCategory;
	__unsafe_unretained NSString *receipts;
	__unsafe_unretained NSString *type;
} CDExpenseRelationships;

@class CDDeductionCategory;
@class CDReceipt;
@class CDType;

@interface CDExpenseID : NSManagedObjectID {}
@end

@interface _CDExpense : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDExpenseID* objectID;

@property (nonatomic, strong) NSDate* date;

//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gst;

@property (atomic) float gstValue;
- (float)gstValue;
- (void)setGstValue:(float)value_;

//- (BOOL)validateGst:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* longDesc;

//- (BOOL)validateLongDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* shortDesc;

//- (BOOL)validateShortDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* totalAmount;

@property (atomic) float totalAmountValue;
- (float)totalAmountValue;
- (void)setTotalAmountValue:(float)value_;

//- (BOOL)validateTotalAmount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* workRelatedPortion;

@property (atomic) float workRelatedPortionValue;
- (float)workRelatedPortionValue;
- (void)setWorkRelatedPortionValue:(float)value_;

//- (BOOL)validateWorkRelatedPortion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) CDDeductionCategory *deductCategory;

//- (BOOL)validateDeductCategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *receipts;

- (NSMutableSet*)receiptsSet;

@property (nonatomic, strong) CDType *type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@end

@interface _CDExpense (ReceiptsCoreDataGeneratedAccessors)
- (void)addReceipts:(NSSet*)value_;
- (void)removeReceipts:(NSSet*)value_;
- (void)addReceiptsObject:(CDReceipt*)value_;
- (void)removeReceiptsObject:(CDReceipt*)value_;

@end

@interface _CDExpense (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;

- (NSNumber*)primitiveGst;
- (void)setPrimitiveGst:(NSNumber*)value;

- (float)primitiveGstValue;
- (void)setPrimitiveGstValue:(float)value_;

- (NSString*)primitiveLocation;
- (void)setPrimitiveLocation:(NSString*)value;

- (NSString*)primitiveLongDesc;
- (void)setPrimitiveLongDesc:(NSString*)value;

- (NSString*)primitiveShortDesc;
- (void)setPrimitiveShortDesc:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSNumber*)primitiveTotalAmount;
- (void)setPrimitiveTotalAmount:(NSNumber*)value;

- (float)primitiveTotalAmountValue;
- (void)setPrimitiveTotalAmountValue:(float)value_;

- (NSNumber*)primitiveWorkRelatedPortion;
- (void)setPrimitiveWorkRelatedPortion:(NSNumber*)value;

- (float)primitiveWorkRelatedPortionValue;
- (void)setPrimitiveWorkRelatedPortionValue:(float)value_;

- (CDDeductionCategory*)primitiveDeductCategory;
- (void)setPrimitiveDeductCategory:(CDDeductionCategory*)value;

- (NSMutableSet*)primitiveReceipts;
- (void)setPrimitiveReceipts:(NSMutableSet*)value;

- (CDType*)primitiveType;
- (void)setPrimitiveType:(CDType*)value;

@end
