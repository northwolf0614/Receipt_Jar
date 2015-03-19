// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDCategory.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDCategoryAttributes {
	__unsafe_unretained NSString *color;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *symbolLetter;
} CDCategoryAttributes;

extern const struct CDCategoryRelationships {
	__unsafe_unretained NSString *expenses;
} CDCategoryRelationships;

@class CDExpense;

@class UIColor;

@interface CDCategoryID : NSManagedObjectID {}
@end

@interface _CDCategory : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDCategoryID* objectID;

@property (nonatomic, strong) UIColor* color;

//- (BOOL)validateColor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* symbolLetter;

//- (BOOL)validateSymbolLetter:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *expenses;

- (NSMutableSet*)expensesSet;

@end

@interface _CDCategory (ExpensesCoreDataGeneratedAccessors)
- (void)addExpenses:(NSSet*)value_;
- (void)removeExpenses:(NSSet*)value_;
- (void)addExpensesObject:(CDExpense*)value_;
- (void)removeExpensesObject:(CDExpense*)value_;

@end

@interface _CDCategory (CoreDataGeneratedPrimitiveAccessors)

- (UIColor*)primitiveColor;
- (void)setPrimitiveColor:(UIColor*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveSymbolLetter;
- (void)setPrimitiveSymbolLetter:(NSString*)value;

- (NSMutableSet*)primitiveExpenses;
- (void)setPrimitiveExpenses:(NSMutableSet*)value;

@end
