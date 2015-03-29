// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDType.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDTypeAttributes {
	__unsafe_unretained NSString *color;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *sortIndex;
	__unsafe_unretained NSString *symbolLetter;
} CDTypeAttributes;

extern const struct CDTypeRelationships {
	__unsafe_unretained NSString *expenses;
} CDTypeRelationships;

@class CDExpense;

@class UIColor;

@interface CDTypeID : NSManagedObjectID {}
@end

@interface _CDType : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDTypeID* objectID;

@property (nonatomic, strong) UIColor* color;

//- (BOOL)validateColor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* sortIndex;

@property (atomic) int32_t sortIndexValue;
- (int32_t)sortIndexValue;
- (void)setSortIndexValue:(int32_t)value_;

//- (BOOL)validateSortIndex:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* symbolLetter;

//- (BOOL)validateSymbolLetter:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *expenses;

- (NSMutableSet*)expensesSet;

@end

@interface _CDType (ExpensesCoreDataGeneratedAccessors)
- (void)addExpenses:(NSSet*)value_;
- (void)removeExpenses:(NSSet*)value_;
- (void)addExpensesObject:(CDExpense*)value_;
- (void)removeExpensesObject:(CDExpense*)value_;

@end

@interface _CDType (CoreDataGeneratedPrimitiveAccessors)

- (UIColor*)primitiveColor;
- (void)setPrimitiveColor:(UIColor*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveSortIndex;
- (void)setPrimitiveSortIndex:(NSNumber*)value;

- (int32_t)primitiveSortIndexValue;
- (void)setPrimitiveSortIndexValue:(int32_t)value_;

- (NSString*)primitiveSymbolLetter;
- (void)setPrimitiveSymbolLetter:(NSString*)value;

- (NSMutableSet*)primitiveExpenses;
- (void)setPrimitiveExpenses:(NSMutableSet*)value;

@end
