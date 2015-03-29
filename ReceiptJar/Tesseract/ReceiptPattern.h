//
//  ReceiptPattern.h
//  Tesseract_Demo
//
//  Created by Jack Lin on 27/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <Foundation/Foundation.h>
//finally we have to fill the keys as "prices" "items" "words"
@interface ReceiptPattern : NSObject
@property(nonatomic,strong) NSString* patternID;
@property(nonatomic,strong) NSString* datePattern;
@property(nonatomic,strong) NSString* itemPricePattern;
@property(nonatomic,strong) NSString* pricePattern;
@property(nonatomic,strong) NSString* lineWordsPattern;
@property(nonatomic,strong) NSString* lastPricePattern;
-(id)initWithPatterID:(NSString*)patternID;
@end
