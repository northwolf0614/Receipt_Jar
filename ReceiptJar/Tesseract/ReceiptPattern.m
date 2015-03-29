//
//  ReceiptPattern.m
//  Tesseract_Demo
//
//  Created by Jack Lin on 27/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import "ReceiptPattern.h"
#import "Patterns.h"

@implementation ReceiptPattern
-(id)initWithPatterID:(NSString*)patternID
{
    if (self=[super init])
    {
        if ([patternID isEqualToString:woolWorthReceipt])
        {
            self.patternID=woolWorthReceipt;
            self.itemPricePattern=@"(.*[\f\n\r\t\v]*)([0-9]{1,10}[.][0-9]{1,3}\n)";
            self.pricePattern=@"[0-9]{1,10}[.][0-9]{1,3}";
            self.lineWordsPattern=@".*[\f\n\r\t\v]*";
            self.lastPricePattern=@"[0-9]{1,10}[.][0-9]{1,3}\n";
        }
    }
    return self;
}
@end
