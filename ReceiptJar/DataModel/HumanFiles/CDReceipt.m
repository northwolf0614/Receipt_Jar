#import "CDReceipt.h"
#import "CDExpense.h"

@interface CDReceipt ()

// Private interface goes here.

@end

@implementation CDReceipt

// Custom logic goes here.
- (void)setupRawData{
    if (self.expense && self.rawData) {
        //Numbers
        NSArray* numbers = self.rawData[@"Numbers"];
        if (!self.expense.totalAmount) {
            self.expense.totalAmountValue = [[numbers firstObject] floatValue];
        }
    }
}
@end
