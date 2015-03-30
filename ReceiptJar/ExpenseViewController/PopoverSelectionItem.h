//
//  PopoverSelectionItem.h
//  ReceiptJar
//
//  Created by Lei Zhao on 30/03/2015.
//  Copyright (c) 2015 funkytonic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopoverSelectionItem : NSObject
@property (nonatomic, strong) NSString* value;
@property (nonatomic, strong) UIColor* color;
@property (nonatomic, assign) BOOL selected;

@end
