// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDGroup.h instead.

#import <CoreData/CoreData.h>
#import "MYManagedObject.h"

extern const struct CDGroupAttributes {
	__unsafe_unretained NSString *color;
	__unsafe_unretained NSString *name;
} CDGroupAttributes;

extern const struct CDGroupRelationships {
	__unsafe_unretained NSString *expenses;
} CDGroupRelationships;

@class CDExpense;

@class UIColor;

@interface CDGroupID : NSManagedObjectID {}
@end

@interface _CDGroup : MYManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CDGroupID* objectID;

@property (nonatomic, strong) UIColor* color;

//- (BOOL)validateColor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *expenses;

- (NSMutableSet*)expensesSet;

@end

@interface _CDGroup (ExpensesCoreDataGeneratedAccessors)
- (void)addExpenses:(NSSet*)value_;
- (void)removeExpenses:(NSSet*)value_;
- (void)addExpensesObject:(CDExpense*)value_;
- (void)removeExpensesObject:(CDExpense*)value_;

@end

@interface _CDGroup (CoreDataGeneratedPrimitiveAccessors)

- (UIColor*)primitiveColor;
- (void)setPrimitiveColor:(UIColor*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveExpenses;
- (void)setPrimitiveExpenses:(NSMutableSet*)value;

@end
