// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDDeductionCategory.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDDeductionCategoryAttributes {
	__unsafe_unretained NSString *color;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *sortIndex;
} CDDeductionCategoryAttributes;

extern const struct CDDeductionCategoryRelationships {
	__unsafe_unretained NSString *expenses;
} CDDeductionCategoryRelationships;

@class CDExpense;

@class UIColor;

@interface CDDeductionCategoryID : NSManagedObjectID {}
@end

@interface _CDDeductionCategory : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDDeductionCategoryID* objectID;

@property (nonatomic, strong) UIColor* color;

//- (BOOL)validateColor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* sortIndex;

@property (atomic) int32_t sortIndexValue;
- (int32_t)sortIndexValue;
- (void)setSortIndexValue:(int32_t)value_;

//- (BOOL)validateSortIndex:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *expenses;

- (NSMutableSet*)expensesSet;

@end

@interface _CDDeductionCategory (ExpensesCoreDataGeneratedAccessors)
- (void)addExpenses:(NSSet*)value_;
- (void)removeExpenses:(NSSet*)value_;
- (void)addExpensesObject:(CDExpense*)value_;
- (void)removeExpensesObject:(CDExpense*)value_;

@end

@interface _CDDeductionCategory (CoreDataGeneratedPrimitiveAccessors)

- (UIColor*)primitiveColor;
- (void)setPrimitiveColor:(UIColor*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveSortIndex;
- (void)setPrimitiveSortIndex:(NSNumber*)value;

- (int32_t)primitiveSortIndexValue;
- (void)setPrimitiveSortIndexValue:(int32_t)value_;

- (NSMutableSet*)primitiveExpenses;
- (void)setPrimitiveExpenses:(NSMutableSet*)value;

@end
